from flask import Flask ,render_template,request,session,redirect
from flask_sqlalchemy import SQLAlchemy
import json
from flask_mail import Mail
from datetime import datetime
import math
import os
from werkzeug.utils import secure_filename

with open(r'E:\flask\config.json', 'r') as c:
    params = json.load(c)["params"]
    
local_server = True  

app = Flask(__name__)
app.secret_key = 'super-secret-key'
app.config['UPLOAD_FOLDER'] = params['upload_location']
app.config.update(
    MAIL_SERVER = 'smtp.gmail.com',
    MAIL_PORT = '465',
    MAIL_USE_SSL = True,
    MAIL_USERNAME = params['gmail-user'],
    MAIL_PASSWORD = params['gmail-password']
)
mail=Mail(app)

if(local_server):
    app.config['SQLALCHEMY_DATABASE_URI'] = params['local_uri']
else:
    app.config['SQLALCHEMY_DATABASE_URI'] = params['prod_uri']

db = SQLAlchemy(app)



class Contact(db.Model):
    # srno	Name	email	phone_no	massage	date	

    srno = db.Column(db.Integer, primary_key=True)
    Name = db.Column(db.String(80), nullable=False)
    email = db.Column(db.String(20), nullable=False)
    phone_no = db.Column(db.String(12), nullable=False)
    massage = db.Column(db.String(120), nullable=False)
    date = db.Column(db.String(12), nullable=True)
    
class Post(db.Model):
    srno = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(80), nullable=False)
    slug = db.Column(db.String(21), nullable=False)
    content = db.Column(db.String(120), nullable=False)
    date = db.Column(db.String(12), nullable=True)
    img_file = db.Column(db.String(12), nullable=True)
    subheading = db.Column(db.String(120), nullable=False)
    
@app.route("/")
def home():
    posts = Post.query.filter_by().all()
    last = math.ceil(len(posts)/int(params['no_of_posts']))
    page = request.args.get('page')
    if (not str(page).isnumeric()):
        page = 1
    page = int(page)
    posts = posts[(page-1)*int(params['no_of_posts']):(page-1)*int(params['no_of_posts'])+ int(params['no_of_posts'])]
    if page==1:
        prev = "#"
        next = "/?page="+ str(page+1)
    elif page==last:
        prev = "/?page="+ str(page-1)
        next = "#"
    else:
        prev = "/?page="+ str(page-1)
        next = "/?page="+ str(page+1)
    
    return render_template('index.html', params=params, posts=posts, prev=prev, next=next)

@app.route("/uploader" , methods=['GET', 'POST'])
def uploader():
    if "user" in session and session['user']==params['admin_user']:
        if request.method=='POST':
            f = request.files['file1']
            f.save(os.path.join(app.config['UPLOAD_FOLDER'], secure_filename(f.filename)))
            return "Uploaded successfully!"

@app.route('/logout')
def logout():
    session.pop('user')
    return redirect('/dashboard')

@app.route("/delete/<string:srno>" , methods=['GET', 'POST'])
def delete(srno):
    if "user" in session and session['user']==params['admin_user']:
        post = Post.query.filter_by(srno=srno).first()
        db.session.delete(post)
        db.session.commit()
    return redirect("/dashboard")

@app.route("/dashboard", methods = ['GET', 'POST'])
def dashboard(): 
    if 'user' in session and session['user'] == params['admin_user']:
        posts = Post.query.all()
        return render_template('dashboard.html', params=params, posts=posts)
    
    if request.method == 'POST':
        username = request.form.get('uname')
        userpass = request.form.get('pass')
        if username == params['admin_user'] and userpass == params['admin_password']:
            session['user'] = username
            posts = Post.query.all()
            return render_template('dashboard.html', params=params, posts=posts)
    return render_template("login.html", params=params)

@app.route("/edit/<string:srno>" , methods=['GET', 'POST'])
def edit(srno):
    if "user" in session and session['user']==params['admin_user']:
        if request.method=="POST":
            box_title = request.form.get('title')
            tline = request.form.get('tagline')
            slug = request.form.get('slug')
            content = request.form.get('Content')
            img_file = request.form.get('img_file')
            date = datetime.now()
            if srno=='0':
                post = Post(title=box_title, slug=slug, content=content, subheading=tline, img_file=img_file, date=date)
                db.session.add(post)
                db.session.commit()
            else:
                post = Post.query.filter_by(srno=srno).first()
                post.title = box_title
                post.subheading = tline
                post.slug = slug
                post.content = content
                post.img_file = img_file
                post.date = date
                db.session.commit()
                return redirect('/edit/'+srno)
        post = Post.query.filter_by(srno=srno).first()        
        return render_template('edit.html', params = params, post=post)
@app.route('/about')
def about():
    return render_template('about.html', params = params)

@app.route("/contact", methods = ['GET', 'POST'])
def contact():
    if request.method == 'POST':
        name = request.form.get('name')
        email = request.form.get('email')
        phone = request.form.get('phone')
        message = request.form.get('message')
        entry = Contact(Name=name, email = email,phone_no = phone, massage = message , date = datetime.now())
        db.session.add(entry)
        db.session.commit()
        mail.send_message('New message from ' + name,
        sender = email,
        recipients = [params['gmail-user']],
        body = message + "\n" + phone
        )
    return render_template('contact.html', params = params)

@app.route('/post/<string:post_slug>', methods = ['GET'])
def post_route(post_slug):
    post=Post.query.filter_by(slug=post_slug).first()
    return render_template('post.html', params = params,post=post)
app.run(debug=True)