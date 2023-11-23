

# Flask Blog Website

## Overview

This is a simple yet powerful blog website built using Flask, HTML, CSS, JS, and Jinja. The application includes features like a home page displaying blog posts, an about page, a contact page with email notifications, and an admin login page for managing blog content.

## Features

1. **Home Page:**
   - Displays a single blog post at a time.
   - Navigation buttons for previous and next posts.

2. **About Page:**
   - Provides information about the website and its purpose.

3. **Contact Page:**
   - Allows users to submit their contact details.
   - Sends an automatic email notification with the user's information.

4. **Admin Login Page:**
   - Add, edit, and delete blog posts.
   - Upload files related to blog content.

## Setup

### Prerequisites

- Python environment with Flask installed.
- XAMPP for database setup (MySQL).

### Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/sahilgoyal7214/Flask-Blog.git
   cd Flask-Blog
   ```

2. Install dependencies:

   ```bash
   pip install -r requirements.txt
   ```

3. Configure the database:

   - Start XAMPP, and ensure both Apache and MySQL are running.
   - Create a new database in phpMyAdmin.
   - Import the provided `quantum_codebreakers.sql` file.

4. Configure the application:

   - Open `config.json` and set the following parameters:
     - `local_uri`: Local database URI.
     - `prod_uri`: Production database URI.
     - `gmail-user`: Your Gmail email address.
     - `gmail-password`: Your Gmail password.
     - `about_p1`: First paragraph of the about page.
     - `about_p2`: Second paragraph of the about page.
     - `about_p3`: Third paragraph of the about page.
     - `website_title`: Title of your blog website.
     - `tagline`: A brief tagline for your website.
     - `no_of_posts`: Number of posts to display on the home page.
     - `login_image`: Image for the login page.
     - `admin_user`: Admin username for the login page.
     - `admin_password`: Admin password for the login page.
     - `upload_location`: Path to the location for file uploads.

5. Run the application:

   ```bash
   python main.py
   ```

   Visit `http://localhost:5000` in your browser.

## Configuration

update `config.json` and set the following parameters:  
     - `local_uri`: Local database URI.  
     - `prod_uri`: Production database URI.  
     - `gmail-user`: Your Gmail email address.  
     - `gmail-password`: Your Gmail password.  
     - `about_p1`: First paragraph of the about page.  
     - `about_p2`: Second paragraph of the about page.  
     - `about_p3`: Third paragraph of the about page.  
     - `website_title`: Title of your blog website.  
     - `tagline`: A brief tagline for your website.  
     - `no_of_posts`: Number of posts to display on the home page.  
     - `login_image`: Image for the login page.  
     - `admin_user`: Admin username for the login page.  
     - `admin_password`: Admin password for the login page.  
     - `upload_location`: Path to the location for file uploads.  


## Contact

For any issues or questions, please contact [Sahil Goyal](in/sahil-goyal-1a731124a).


