<link rel="stylesheet" href="style.css">

# Comprehensive Rails - Jordan Hudgens
# [From Udemy](https://www.udemy.com/comprehensive-ruby-on-rails/learn/v4/content)
# [heroku app](https://udemy-hudg-enterpriseape.herokuapp.com/)

### how to load a previous app written with older ruby

1. add the version of ruby in gem file: ruby '2.2.2'
2. in terminal, go to the directory and type rbenv local 2.2.2
3. ruby -v
4. rails s
5. [from here](https://makandracards.com/makandra/21545-rbenv-how-to-switch-to-another-ruby-version-temporarily-per-project-or-globally)

## section 2 - application setup and source version controll

### creating a new rails app

1. he uses nitrous
2. go to directory
3. rails new enterpriseape
4. rails s
5. rails g scaffold Invoice date:datetime company:string tax:decimal salesperson:string 
6. rails db:migrate
7. rails s
8. localhost/invoices
9. create a new invoice

### creating a git repository 

1. in github create a new repository
2. git init
3. git add .
4. git commit -m "Initial commit"
5. copy the code from github to push up the commit 

## section 3 - deploying to the web

### deploying a ruby on rails app to heroku - video 4

1. heroku login, email, password
2. heroku create udemy-enterpriseape
3. move the sqlite3 to development 
4. create the production with pg

```
group :production do
  gem 'pg'
  gem 'rails_12factor'
end
```

5. bundle install --without production
6. git commit 
7. git push heroku master
8. heroku run rake db:migrate
9. heroku restart

### markdown syntax tutorial - video 5

Enterprise Ape
==============

Powerful Software
-----------------

### Welcome to the repository

Feel free to access [my portfolio](http://portfolio.jordanhudgens.com).

> ## A block quote I think
>
> Lorem ipsum is the way of the past, the new is hipster ipsum
>
> This is *italics*
>
This is another **bold**

### Crazy good software
* rapid dev
+ tested
- 24/7 support

### reasons to choose us
1. price
2. precision
3. performance

This is what ruby code would look like `puts 'Hello world'`

### how to remove a file from a git repository - video 6

1. rename README.rdoc to README.md
2. git status
3. it would say 'deleted: README.rdoc'
4. type: git rm README.rdoc
5. git status
6. it should be Green now
7. git add ., git commit -m "Updated readme file"

## section 4 - integrating design functionalities

### integrating a navigation bar into a ruby on rails app - video 7

1. in routes

```
root 'invoices#index'
```

2. rails s, go to homepage
3. in the layouts/app, above the 'yield'

```
<%= link_to "Home", root_path %>
<%= link_to "About Us", "#" %>
<%= link_to "Contact", "#" %>
<%= link_to "Features", "#" %>
<%= link_to "FAQs", "#" %>
<%= link_to "Pricing", "#" %>
<%= link_to "Login", "#" %>
```

### making the nav bar functional - video 8

1. rails g controller Welcome index about contact faq pricing features 
2. update the nav section

```
<%= link_to "Home", root_path %>
<%= link_to "About Us", welcome_about_path %>
<%= link_to "Contact", welcome_contact_path %>
<%= link_to "Features", welcome_features_path %>
<%= link_to "FAQs", welcome_faq_path %>
<%= link_to "Pricing", welcome_pricing_path %>
<%= link_to "Invoices", invoices_path %>
<%= link_to "Login", "#" %>
```

3. in routes change the route

```
root 'welcome#index'
```

4. git commit -m "Built out navigation and added welcome controller and set root"
5. git push heroku master

### creating a git branch

1. git co -b testingbranch
2. edit a file
3. git commit
4. git push origin testingbranch
5. git co master
6. git merge testingbranch
7. git push 
8. **repairing a mistake**
9. go to layout/app and delete everything
10. git status, should show you the modified file
11. type: git co -- app/views/layouts/application.html.erb
12. git status, and if should be back up to date, and the changes undone

### installing bootstrap into a rails app - video 10

1. git co -b add-bootstrap
2. add the bootstrap-sass gems and jquery rails
3. rename app scss
4. @imports...
5. require js
6. update the nav

```
<div class="container">
  <ul class="nav nav-tabs">
    <li><%= link_to "Home", root_path %></li>
    <li><%= link_to "About Us", welcome_about_path %></li>
    <li><%= link_to "Contact", welcome_contact_path %></li>
    <li><%= link_to "Features", welcome_features_path %></li>
    <li><%= link_to "FAQs", welcome_faq_path %></li>
    <li><%= link_to "Pricing", invoices_path %></li>
    <li><%= link_to "Invoices", invoices_path %></li>
    <li><%= link_to "Login", "#" %> </li>
  </ul>

  <%= yield %>
</div>
```

7. git merge adding-bootstrap
8. git push heroku
9. **if it didnt compile the assets**
10. in production.rb, update the line to be true 

```
config.assets.compile = true
```

11. git commit -m "Fixed heroku compiling bug"
12. git push heroku
13. refresh heroku page

### customizing HTML table in your rails app - video 11

1. git co -b style-table
2. in the invoices/index, update the table

```
<div class="media">
  <div class="media-body">
    <table class="table table-hover">
      <thead>
        <tr>
          <th>Date</th>
          <th>Company</th>
          <th>Tax</th>
          <th>Salesperson</th>
          <th colspan="3"></th>
        </tr>
      </thead>

      <tbody>
        <% @invoices.each do |invoice| %>
          <tr>
            <td><%= invoice.date %></td>
            <td><%= invoice.company %></td>
            <td><%= invoice.tax %></td>
            <td><%= invoice.salesperson %></td>
            <td><%= link_to 'Show', invoice, class: 'btn btn-mini' %></td>
            <td><%= link_to 'Edit', edit_invoice_path(invoice), class: 'btn btn-mini btn-success' %></td>
            <td><%= link_to 'Destroy', invoice method: :delete, class: 'btn btn-mini btn-danger', data: { confirm: 'Are you sure?' } %></td>
          </tr>
        <% end %>
      </tbody>
    </table>
  </div>
</div>
```

3. refresh and see if it works

### strftime data formatting - video 12

1. in invoices/index update the data line

```
<td><%= invoice.date.strftime("%Y/%m/%d") %></td>
```

### how to remove a file from git - video 13

1. git rm app/assets/stylesheets/application.css

### integrating a date range search field - video 14

1. in invoices/index update the page to have search fields

```
<div class="row">
  <h1>Listing Invoices</h1>
  <div class="pull-right range-query">
    <%= form_tag invoices_path, method: :get do %>
      <%= text_field_tag 'search[date_from]', @search.date_from %>
      <%= text_field_tag 'search[date_to]', @search.date_to %>
      <%= submit_tag 'Search', class: 'btn search-button' %>
    <% end %>
  </div>
</div>
```

2. create models/invoice_search.rb file

```
class InvoiceSearch
  attr_reader :date_from, :date_to

  def initialize(params)
    params ||= {}
    @date_from = parsed_date(params[:date_from], 7.days.ago.to_date)
    @date_to = parsed_date(params[:date_to], Date.today)
  end

  def scope
    # Invoice.where('date BETWEEN ? AND ?', @date_from, @date_to)
    Invoice.where(:date => @date_from.beginning_of_day.to_s..@date_to.end_of_day.to_s)
  end

  private

  def parsed_date(date_string, default)
    Date.parse(date_string)
  rescue ArgumentError, TypeError
    default
  end
end
```

3. undate index action in invoices controller

```
  def index
    @search = InvoiceSearch.new(params[:search])
    @invoices = @search.scope
  end
```

4. refresh and test out

### how to install and configure devise for user authentication - video 15

1. git co -b add-devise
2. git branch
3. add the devise gem
4. bundle install --without production
5. rails g devise:install
6. add the devise todos
7. in dev env add the mailer

```
config.action_mailer.default_url_options = { :host => 'localhost:300' }
config.action_mailer.delivery_method = :smtp
config.action_mailer.perform_deliveries = true
```

8. in layouts app, add the default notices

```
<p class="notice"><%= notice %></p>
<p class="alert"><%= alert %></p>
```

9. rails g devise:views
10. rails g devise User
11. go to the migrate file
12. uncomment the *confirmable* section

```
t.string :confirmation_token 
etc...
```

13. rails db:migrate
14. in models/user.rb
15. add  the ':confirmable' to the accepted parameters
16. **USING SENDGRID**
17. in terminal: heroku auth:logout
18. heroku addons:add sendgrid:starter
19. endter heroku credentials
20. heroku addons (to see all the addons we are using)
21. heroku config:get SENDGRID_USERNAME
22. heroku config:get SENDGRID_PASSWORD
23. in config/initializers/ create setup_mail.rb, and add the code

```
ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :address                =>  'smptp.sendgrid.net',
  :port                   =>  '587',
  :authentication         =>  :plain,
  :user_name              =>  '(add the user name we got from heroku)',
  :password               =>  '(add the password we got from heroku)',
  :domain                 =>  'heroku.com',
  :enable_starttle_auto   =>  true
}
```

24. rails s
25. if no errors, go to localhost/users/sign_up
26. enter info
27. should have sent a confirmation link
28. in server log find email conf

### fixing a devise bug on nitrous - video 16

1. you have to right click the link sent, then go to the nitrous address bar and paste the link without the local host part

### setting up automated rules for signed in/signed out statuses

1. in layouts/app, update the login with current user

```
<% if current_user %>
  <li><%= link_to "Sign Out", destroy_user_session_path, method: :delete %></li>
<% else %>
  <li><%= link_to "Sign Up", new_user_registration_path %></li>
  <li><%= link_to "Sign In", new_user_session_path %></li>
<% end %>
```

### integrating alert messages - video 18

1. in layouts app add

```
<% if flash[:notice] %>
  <div class="alert alert-success">
    <button type="button" class="close" data-dismiss="alert">&times;</button>
    <%= flash[:notice] %>
  </div>
<% elsif flash[:error] %>
  <div class="alert alert-error">
    <button type="button" class="close" data-dismiss="alert">&times;</button>
    <%= flash[:error] %>
  </div>
<% elsif flash[:alert] %>
  <div class="alert">
    <button type="button" class="close" data-dismiss="alert">&times;</button>
    <%= flash[:alert] %>
  </div>  
<% end %>
```

### how to build a csv uploader into your rails app - video 19

1. git co -b csv-uploader
2. rails g scaffold Company name:string manager:string status:string terms:integer --no-stylesheets
3. rails db:migrate
4. localhost/companies
5. create a new company
6. update the table in companies/index

```
<div class="media">
  <div class="media-body">
    <table class="table table-hover">
      <thead>
        <tr>
          <th>Name</th>
          <th>Manager</th>
          <th>Status</th>
          <th>Terms</th>
          <th colspan="3"></th>
        </tr>
      </thead>

      <tbody>
        <% @companies.each do |company| %>
          <tr>
            <td><%= company.name %></td>
            <td><%= company.manager %></td>
            <td><%= company.status %></td>
            <td><%= company.terms %></td>
            <td><%= link_to 'Show', company, class: 'btn btn-default' %></td>
            <td><%= link_to 'Edit', edit_company_path(company), class: 'btn btn-default btn-success' %></td>
            <td><%= link_to 'Destroy', company, method: :delete, class: 'btn btn-default btn-danger', data: { confirm: 'Are you sure?' } %></td>
          </tr>
        <% end %>
      </tbody>
    </table>
  </div>
</div>
```

7. **CREATING THE FORM FOR THE CSV UPLOADER**
8. at the bottom of the companies/index add

```
<h3>Import Companies</h3>
<%= form_tag import_companies_path, multipart: true do %>
  <%= file_field_tag :file %>
  <%= submit_tag "Upload Companies", class: 'btn btn-default %>
<% end %>
```

9. in routes update companies

```
resources :companies do
  collection { post :import }
end
```

10. in companies controller, create a custom method under destroy

```
def import
  Company.import(params[:file])
  redirect_to companies_path, notice: "Companies Added Successfully"
end
```

11. in company.rb

```
def self.import(file)
  CSV.foreach(file.path, headers: true) do |row|
    Company.create! row.to_hash
  end
end
```

12. in application.rb, under require 'rails/all'

```
require 'csv'
```

13. rails s
14. go to companies

## create a csv downloader - video 19

1. in companies controller, update the index action

```
def index
  @companies = Company.all

  respond_to do |format|
    format.html
    format.csv { send_data @companies.to_csv, filename: "companies-#{Date.today}.csv" }
  end  
end
```

2. in Company.rb create method

```
  def self.to_csv
    CSV.generate(headers: true) do |csv|
      csv << column_names

      all.each do |company|
        csv << company.attributes.values_at(*column_names)
      end
    end
  end  
```

3. restart server
4. go to localhost/companies.csv, and it should download
5. in the company/index add the button

```
<h3>Download File</h3>
<%= link_to "Report", companies_path(format: "csv"), class: 'btn btn-default' %>
```

6. refresh and test out the button 

### form customization - video 21

1. in the invoices form partial 

```
<div class="row">
  <%= form_for @invoice, html: { class: 'form-horizontal' } do |form| %>
    <% if @invoice.errors.any? %>
      <div class="alert alert-danger alert-dismissable">
        <button aria-hidden="true" class="close" data-dismiss="alert" type="button">&times;</button>
        <h4>
          <%= "#{pluralize(@invoice.errors.count, "error")} prohibited this invoice from being saved:" %>
        </h4>
        <ul>
          <% @invoice.errors.full_messages.each do |msg| %>
            <li>
              <%= msg %>
            </li>
          <% end %>
        </ul>
      </div>
    <% end %>

    <div class="form-group">
      <%= form.label :date, class: 'col-sm-2 control-label' %>
      <div class="col-sm-10">
        <%= form.date_select :date, id: :invoice_date, class: "form-control" %>
      </div>
    </div>

    <div class="form-group">
      <%= form.label :company, class: 'col-sm-2 control-label' %>
      <div class="col-sm-10">
        <%= form.text_field :company, id: :invoice_company, class: "form-control" %>
      </div>
    </div>

    <div class="form-group">
      <%= form.label :tax, class: 'col-sm-2 control-label' %>
      <div class="col-sm-10">
        <%= form.text_field :tax, id: :invoice_tax, class: "form-control" %>
      </div>
    </div>

    <div class="form-group">
      <%= form.label :salesperson, class: 'col-sm-2 control-label' %>
      <div class="col-sm-10">
        <%= form.text_field :salesperson, id: :invoice_salesperson, class: "form-control" %>
      </div>
    </div>

    <div class="form-group">
      <div class="col-sm-offset-2 col-sm-10">
        <%= form.submit "Submit", class: "btn btn-lg btn-primary" %>
      </div>
    </div>
  <% end %>  
</div>
```

### integrating a static dropdown element into a rails form - video 22

1. in the invoice form, after salesperson

```
<div class="form-group">
  <%= form.label "Status", class: 'col-sm-2 control-label' %>
  <div class="col-sm-10">
    <%= form.select(:status_type, options_for_select([['PAID', 'PAID'], ['PENDING', 'PENDING']]), { include_blank: true }, class: 'form-control') %>
  </div>
</div>
```

2. rails g migration AddStatusTypeToInvoices status_type:string
3. rails db:migrate
4. in invoice controller, update the strong parameters

```
  def invoice_params
    params.require(:invoice).permit(:date, :company, :tax, :salesperson, :status_type)
  end
```

5. refresh page and create a new one
6. adding status type to index and show
7. in invoice index

```
<th>Status</th>
<td><%= invoice.status_type %></td>
```

8. in invoices show

```
<p>
  <strong>Status</strong>
  <%= @invoice.status_type %>
</p>
```

### integrating a collection select form element - video 23

1. creating a dynamic select dropdown for the sales persons
2. rails g scaffold Employee name:string phone:string job_type:string --no-stylesheets
3. rails db:migrate
4. go to localhost/employees and create a few salespersons and a manager
5. in invoices/form partial update the salesperson from field to be

```
  <div class="form-group">
    <%= form.label "Salesperson", class: 'col-sm-2 control-label' %>
    <div class="col-sm-10">
      <%= collection_select( :invoice, :employee_id, Employee.all, :id, :name, {}, { :multiple => false, class: 'form-control' }) %>
    </div>
  </div>
```

6. we need to change salesperson in the invoices, to salesperson id
7. rails g migration RemoveSalespersonFromInvoices 
8. in the migrate file, update the change

```
  def change
    remove_column :invoices, :salesperson, :string
    add_column :invoices, :salesperson_id, :integer
  end
```

9. rails db:migrate
10. and the end result in the schema.rb should be

```
  create_table "invoices", force: :cascade do |t|
    t.datetime "date"
    t.string "company"
    t.decimal "tax"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status_type"
    t.integer "salesperson_id"
  end
```

11. in invoice.rb

```
belongs_to :salesperson
```

12. **he messed up, it should be employee id not salesperson id, so we have to remove migration again**
13. rails g migration RemoveSalespersonIdFromInvoices
14. in the migrate file

```
  def change
    remove_column :invoices, :salesperson_id, :integer
    add_column :invoices, :employee_id, :integer
  end
```

15. in invocies controller, update strong parameters

```
  def invoice_params
    params.require(:invoice).permit(:date, :company, :tax, :employee_id, :status_type)
  end
```

16. had an error with needing a salesperson so i deleted the belongs_to :salesperson from invoice.rb
17. refresh and create a new inovice with an employee linked

### introduction to the rails console 

1. checking to see if invoice belongs to any employee
2. rails console
3. Employee.all
4. Employee.find_by_name("Beth")
5. Employee.find_by_job_type("Salesperson")
6. Employee.where(job_type: "Salesperson")
7. Employee.where(job_type: "Salesperson").last
8. Employee.where(job_type: "Salesperson").first
9. Employee.where(job_type: "Salesperson").limit(2)
10. i = Invoice.last
11. i.salesperson.name (should be an error)
12. **to fix the problem**
13. in invoice.rb

```
belongs_to :employee
```

14. in employee.rb

```
has_many :invoices
```

15. i = Invoice.last
16. i.employee
17. i.employee.name
18. in invoice/index update the code

```
<td><%= invoice.employee.name %></td>
```

### advanced rails console techniques

1. rails c --sandbox
2. Employee.last
3. _ (underscore brings up the last item query, so Employee.last.name.upcase)
4. then you can do _.downcase _.capitalize
5. Employee.all
6. _.as_json
7. e = Employee.all
8. e.to_xml
9. e.to_yaml
10. e.last.update_attributes(name: "Christine")
11. **to update all attributes in a query**
12. e.where(job_type: "Salesperson").update_all(phone: '555-555-5555')
13. Employee.all (don't do e because the original values are stored)
14. x = Employee.all
15. x.first
16. x.destroy (to delete an entry)
17. reload! (reloads the entire system, in case you updated the models or schema)

### fixing a nomethod error

1. fixed the @invoice.salesperson to @invoice.employee.name in the invoice/show

### creating a dropdown navigation element

1. in the layout/app, in the current user section add

```
<div class="btn-group pull-right right-nav">
  <button type="button" class="btn btn-mini dropdown-toggle" data-toggle="dropdown">              
    <span class="caret"></span>
    <span class="sr-only">Admin</span>              
    Admin
  </button>
  <ul class="dropdown-menu" role="menu">
    <li><%= link_to "Invoices", invoices_path %></li>
    <li><%= link_to "Employees", employees_path %></li>
    <li><%= link_to "Companies", companies_path %></li>
  </ul>
</div>
```

2. in the app.scss

```
.right-nav {
  margin-top: 7px;
}
```

### using a scaffold generator - video 28 (start of the final features, giving users able to add products to invoice)

1. rails g scaffold Purchase name:string category:string quantity:integer invoice_id:integer
2. rails db:migrate

### using the rails console to add items to the database

1. in invoice.rb

```
has_many :purchases
```

2. in purchase.rb

```
belongs_to :invoice
```

3. rails c
4. i = Invoice.last
5. Purchase.create!(name: "Laptop", category: "Hardware", quantity: 2, invoice: i)
6. Purchase.create!(name: "Desktop", category: "Hardware", quantity: 1, invoice: i)
7. i.purchases.all

### setting up nested relationships - video 30

1. in invoices

```
has_many :purchases, dependent: :destroy
```

2. in routes

```
  resources :invoices do
    resources :purchases
  end
```

3. in the invoices controller, update the show to include the purchases

```
  def show
    @purchases = @invoice.purchases
  end
```

4. in invoice show page, add the purchases invoice items table

```
<div class="media">
  <div class="media-body">
    <table class="table table-hover">
      <thead>
        <tr>
          <th>Name</th>
          <th>Category</th>
          <th>Quantity</th>
        </tr>
      </thead>
      <tbody>
        <% @purchases.each do |purchase| %>
          <tr>
            <td><h4><%= purchase.name %></h4></td>
            <td><h4><%= purchase.category %></h4></td>
            <td><h4><%= purchase.quantity %></h4></td>
          </tr>
        <% end %>
      </tbody>
    </table>
  </div>
</div>
```

### adding items to nested attributes

1. in purchases controller, update the new action (we need to find the invoice, based on the invoice id in the params)

```
def new
  @invoice = Invoice.find(params[:invoice_id])
  @purchase = Purchase.new
end
```

2. update the purchases form partial (here we are going to create an array [@invoice and @purchase])

```
<%= form_for [@invoice, @purchase] do |form| %> 

  <div class="field">
    <%= form.label :name %>
    <%= form.text_field :name, id: :purchase_name %>
  </div>

  <div class="field">
    <%= form.label :category %>
    <%= form.text_field :category, id: :purchase_category %>
  </div>

  <div class="field">
    <%= form.label :quantity %>
    <%= form.number_field :quantity, id: :purchase_quantity %>
  </div>

  <div class="actions">
    <%= form.submit %>
  </div>
<% end %>
```

3. get rid of links in purchase.edit and purchase/new, and purchase/show
4. in purchases controller, update the create (we find invoice by invoice id, and assign @invoice to the @purchase.invoice like we did in the rails console)

```
  def create
    @invoice = Invoice.find(params[:invoice_id])
    @purchase = Purchase.new(purchase_params)
    @purchase.invoice = @invoice

    respond_to do |format|
      if @purchase.save
        format.html { redirect_to @invoice, notice: 'Purchase was successfully created.' }
        format.json { render :show, status: :created, location: @invoice }
      else
        format.html { render :new }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end
```

5. at the bottom of invoice/show add the link

```
<%= link_to "Add new item", new_invoice_purchase_path(@invoice), class: 'pull-right' %>
```

6. refresh the page invoice/show,
7. click on 'add new item'
8. create new purchase item
9. **refactoring the invoice set**
10. in purchases controller, from the new and create take out the @invoice call and create in the private section

```
def set_invoice
  @invoice = Invoice.find(params[:invoice_id])
end
```

11. up top add

```
before_action :set_invoice, only: [:new, :create]
```

12. delete the @invoice from new and create

### deleting nested attributes

1. in the invoice/show, at the bottom in the table section, add the delete column

```
<table class="table table-hover">
  <thead>
    <tr>
      <th>Name</th>
      <th>Category</th>
      <th>Quantity</th>
      <th>Delete</th>
    </tr>
  </thead>
  <tbody>
    <% @purchases.each do |purchase| %>
      <tr>
        <td><h4><%= purchase.name %></h4></td>
        <td><h4><%= purchase.category %></h4></td>
        <td><h4><%= purchase.quantity %></h4></td>
        <td><h4><%= link_to "Delete", [@invoice, purchase], method: :delete, data: { confirm: "Are your sure?"} %></h4></td>
      </tr>
    <% end %>
  </tbody>
</table>
```

2. update the before action in the purchase controller

```
before_action :set_invoice, only: [:new, :create, :destroy]
```

3. update the destroy action

```
  def destroy
    title = @purchase.name
    if @purchase.destroy
      flash[:notice] = "\"#{title}\" was deleted successfully."
      redirect_to @invoice
    else
      flash[:error] = "There was an error deleting the purchase item."
      render :show
    end
  end
```

4. refresh and try deleting

### adding columns to a database table

1. adding a price to the purchases table
2. rails g migration AddPriceToPurchases (add_price_to_purchases) price:decimal
3. rails db:migrate
4. rails c
5. Purchase.last and make sure price column is there

### utilizing strong parameters

1. in purchases controller, update the purchase params strong parameters

```
def purchase_params
  params.require(:purchase).permit(:name, :category, :quantity, :invoice_id, :price)
end
```

2. in the purchase/form add the price field

```
<div class="field">
  <%= form.label :price %>
  <%= form.text_field :price, id: :purchase_price %>
</div>
```

3. in invoice/show update the purchase table

```
<table class="table table-hover">
  <thead>
    <tr>
      <th>Name</th>
      <th>Category</th>
      <th>Quantity</th>
      <th>Price</th>
      <th>Delete</th>
    </tr>
  </thead>
  <tbody>
    <% @purchases.each do |purchase| %>
      <tr>
        <td><h4><%= purchase.name %></h4></td>
        <td><h4><%= purchase.category %></h4></td>
        <td><h4><%= purchase.quantity %></h4></td>
        <td><h4><%= number_to_currency(purchase.price) %></h4></td>
        <td><h4><%= link_to "Delete", [@invoice, purchase], method: :delete, data: { confirm: "Are your sure?"} %></h4></td>
      </tr>
    <% end %>
  </tbody>
</table>
```

4. refresh, add a new purchase item with price (if price is 100, number to currency converts it to $100.00)

### performing calculations in rails

1. update the invoice show table to include a total column, for quantity X price

```
<p id="notice"><%= notice %></p>

<p>
  <strong>Date:</strong>
  <%= @invoice.date %>
</p>

<p>
  <strong>Company:</strong>
  <%= @invoice.company %>
</p>

<p>
  <strong>Tax:</strong>
  <%= @invoice.tax %>
</p>

<p>
  <strong>Salesperson:</strong>
  <%= @invoice.employee.name %>
</p>

<p>
  <strong>Status</strong>
  <%= @invoice.status_type %>
</p>

<div class="media">
  <div class="media-body">
    <table class="table table-hover">
      <thead>
        <tr>
          <th>Name</th>
          <th>Category</th>
          <th>Quantity</th>
          <th>Price</th>
          <th>Total</th>
          <th>Delete</th>
        </tr>
      </thead>
      <tbody>
        <% running_total = 0 %>
        <% @purchases.each do |purchase| %>
          <tr>
            <td><h4><%= purchase.name %></h4></td>
            <td><h4><%= purchase.category %></h4></td>
            <td><h4><%= purchase.quantity %></h4></td>
            <td><h4><%= number_to_currency(purchase.price) %></h4></td>
            <td><h4><%= number_to_currency(purchase.quantity * purchase.price) %></h4></td>
            <td><h4><%= link_to "Delete", [@invoice, purchase], method: :delete, data: { confirm: "Are your sure?"} %></h4></td>
            <% running_total = running_total + (purchase.quantity * purchase.price)  %>
          </tr>
        <% end %>
      </tbody>
    </table>
  </div>
</div>

<%= link_to "Add new item", new_invoice_purchase_path(@invoice), class: 'pull-right' %>

<br>

<h4 class="pull-right">Invoice total: <%= number_to_currency(running_total) %></h4>

<%= link_to 'Edit', edit_invoice_path(@invoice) %> |
<%= link_to 'Back', invoices_path %>
```

2. refresh and add new item to see running total

### recap of comprehensive rails series

1. go to the github repo
2. click on '19 commits' to see all the code at the time of the commits

## secion 5 - common bug fixes for rails apps

### quiet the rails logs - video 37

1. gem called 'quiet_assets'
2. in gemfile add

```
get 'quiet_assets', :group => :development
```

3. bundle install
4. rails s
5. click around to different pages, and look at the server logs, there should be less output, mainly queries

### fixing glyhpicon bug in heroku - video 38

1. in production.rb update the compile line

```
config.assets.compile = true
```

2. git push heroku master
3. shift-cmd-r

## section 6 

### upgrade to rails 4.2

1. in gemfile, he changed gem rails '4.0.0' to '4.2.6'
2. bundle install
3. ran bundle update
4. rails s

### implement the ability to edit nested purchases - video 40

1. in purchases controller update the before action set invoice

```
before_action :set_invoice, except: [:index, :show]
```

2. go to http://localhost:3000/invoices/11/purchases/10
3. update the purchase 
4. error should be no purchase url
5. update the purchase controller update action

```
def update
  respond_to do |format|
    if @purchase.update(purchase_params)
      format.html { redirect_to @invoice, notice: 'Purchase was successfully updated.' }
      format.json { render :show, status: :ok, location: @invoice }
    else
      format.html { render :edit }
      format.json { render json: @invoice.errors, status: :unprocessable_entity }
    end
  end
end
```

6. delete the index and show actions and their templates
7. update the set purchase action

```
before_action :set_purchase, only: [:edit, :update, :destroy]
```

8. in routes

```
  resources :invoices do
    resources :purchases, except: [:index, :show]
  end
```

9. update the table in invoices/show to include the edit

```
<table class="table table-hover">
  <thead>
    <tr>
      <th>Name</th>
      <th>Category</th>
      <th>Quantity</th>
      <th>Price</th>
      <th>Total</th>
      <th></th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <% running_total = 0 %>
    <% @purchases.each do |purchase| %>
      <tr>
        <td><h4><%= purchase.name %></h4></td>
        <td><h4><%= purchase.category %></h4></td>
        <td><h4><%= purchase.quantity %></h4></td>
        <td><h4><%= number_to_currency(purchase.price) %></h4></td>
        <td><h4><%= number_to_currency(purchase.quantity * purchase.price) %></h4></td>
        <td><h4><%= link_to 'Edit', edit_invoice_purchase_path(@invoice, purchase) %></h4></td>
        <td><h4><%= link_to "Delete", [@invoice, purchase], method: :delete, data: { confirm: "Are your sure?"} %></h4></td>
        <% running_total = running_total + (purchase.quantity * purchase.price)  %>
      </tr>
    <% end %>
  </tbody>
</table>
```

### remove duplicate notifications

1. get rid of the notices from the scaffolded files

# THE END