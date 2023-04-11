<link rel="stylesheet" href="style.css">

# [From Udemy](https://www.udemy.com/angular-on-rails-course/learn/v4/t/lecture/5996234?start=0)
# [heroku app](#)
# [source code](https://github.com/rails-camp/freelance-camp-fe/tree/dbf26670a67d38748925cf4529e2c4303144e7c3)
# [quickstart guide](https://angular.io/guide/quickstart)

<hr>

## section 2 - system configuration for angular 2 application

### configuring a system to run angular 2 apps

1. [install homebrew](https://brew.sh/) 
2. to see if brew is installed type: brew help
3. in terminal: brew install node
4. to see if node is installed type: node -v
5. in terminaL brew install npm
6. node -v, he's using 5.6.0, im using 6.3.1
7. npm -v, he's using 3.6.0, im using 3.10.3

### generating an angular 2 application from scratch

1. in the my-portfolio/angular create the directory angular-rails
2. mkdir freelance-camp-fe
3. **creating the sublime quick launch from terminal**
4. [click here for tutorial](https://ashleynolan.co.uk/blog/launching-sublime-from-the-terminal)
5. [get package.json from here](https://github.com/rails-camp/freelance-camp-fe/blob/dbf26670a67d38748925cf4529e2c4303144e7c3/package.json)
6. create package.json file in the folder in sublime
7. [get the tsconfig from here](https://github.com/rails-camp/freelance-camp-fe/blob/dbf26670a67d38748925cf4529e2c4303144e7c3/tsconfig.json)
8. create the tsconfig.json file and paste the code in
9. [get this code from here](https://github.com/rails-camp/freelance-camp-fe/blob/dbf26670a67d38748925cf4529e2c4303144e7c3/systemjs.config.js)
10. create the file systemjs.config.js
11. in terminal, make sure you are in the appropriate directory and type: sudo npm install, enter password
12. if it worked, you should see the directory tree

## angular 2 development

### hello angular 2

1. in main dir, create a folder: app/
2. in main dir, create index.html file
3. in app/ dir create the files: app.module.ts, main.ts, homepage.component.ts
4. in the app.module.ts file add the code:

```
import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

@NgModule({
  imports: [
    BrowserModule
  ]
})
export class AppModule {}
```

5. in the main.ts add the code:

```
import { platformBrowserDynamic } from '@angular/platform-browser-dynamic';
import { AppModule } from './app.module';

const platform = platformBrowserDynamic();
platform.bootstrapModule(AppModule);
```
 
6. in homepage.comp add:

```
import { Component } from '@angular/core';

@Component({
  selector: 'main-app',
  template: '<h1>Freelance Bootcamp Dashboard</h1>'
})
export class HomepageComponent {}
```

7. update the app.module to import the homepage

```
import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { HomepageComponent } from './homepage.component';

@NgModule({
  imports: [
    BrowserModule
  ],
  declarations: [
    HomepageComponent
  ],
  bootstrap: [
    HomepageComponent
  ]
})
export class AppModule {}
```

8. in the index.html add:

```
<html>
  <head>
    <title>Freelance Bootcamp</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <script src="node_modules/core-js/client/shim.min.js"></script>
    <script src="node_modules/zone.js/dist/zone.js"></script>
    <script src="node_modules/reflect-metadata/Reflect.js"></script>
    <script src="node_modules/systemjs/dist/system.src.js"></script>
    <script src="systemjs.config.js"></script>
    <script>
      System.import('app').catch(function(err){ console.error(err); });
    </script>
  </head>

  <body>
    <main-app>App Loading...</main-app>
  </body>
</html>
```

9. in terminal type: npm start; I had errors, had to update the tsconfig file to be:

```
{
  "compilerOptions": {
    "target": "es5",
    "module": "commonjs",
    "moduleResolution": "node",
    "sourceMap": true,
    "emitDecoratorMetadata": true,
    "experimentalDecorators": true,
    "removeComments": false,
    "noImplicitAny": false,
    "skipLibCheck": true
  }
}
```

### working with browser sync

1. showed how that works

### creating the app component

1. in app, create homepage folder and move the homepage files in there
2. in app dir, create the file: app.component.ts and add the code (in the template section, it is backticks not single quotation makrs, and the 'router-outlet' code is like the rails 'yield'):

```
import { Component } from '@angular/core';

@Component({
  moduleId: module.id,
  selector: 'app',
  template: `
  <h1>Navigation</h1>
  
  <router-outlet></router-outlet>
  `
})

export class AppComponent {
  title: 'Freelance Bootcamp Dashboard'
}
```

3. update the homepage/homepage.comp file to be:

```
import { Component } from '@angular/core';

@Component({
  selector: 'homepage',
  template: '<h1>Home</h1>'
})
export class HomepageComponent {}
```

4. in the index.html, update the main-app selector:

```
<app>App Loading...</app>
```

5. in app.module.ts update the homepage comp, and create new component, and add under declerations and update bootstrap (which is the first thing to be called)

```
import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppComponent } from './app.component';
import { HomepageComponent } from './homepage/homepage.component';

@NgModule({
  imports: [
    BrowserModule
  ],
  declarations: [
    AppComponent,
    HomepageComponent
  ],
  bootstrap: [
    AppComponent
  ]
})
export class AppModule {}
```

6. the site should refresh and show navigation

### introduction to angular 2 routing

1. in app dir, create file: app-routing.module.ts

```
import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

import { HomepageComponent } from './homepage/homepage.component';

const routes: Routes = [
  { path: '', redirectTo: '/home', pathMatch: 'full' },
  { path: 'home', component: HomepageComponent }
]

@NgModule({
  imports: [ RouterModule.forRoot(routes) ],
  exports: [ RouterModule ]
})
export class AppRoutingModule {}
```

2. in index.html, in the head, before the title tag add:

```
<base href='/'>
```

3. in app.module.ts add the approuting import and add to imports:

```
import { AppRoutingModule } from './app-routing.module';


@NgModule({
  imports: [
    BrowserModule,
    AppRoutingModule
  ],

... 


```

### how to create view files in angular 2

1. in app/homepage create the file: homepage.component.html

```
<h1>Home</h1>

<p>Welcome to the freelance dashboard</p>
```

2. update the homepage.component.ts file to be:

```
import { Component } from '@angular/core';

@Component({
  moduleId: module.id,
  selector: 'homepage',
  templateUrl: 'homepage.component.html'
})
export class HomepageComponent {}
```

2. we added the moduleId, and changed template to be templateUrl
3. in app dir, create the file: app.component.html

```
<h1>Navigation</h1>

<router-outlet></router-outlet>
```

4. and update the app.component.ts to be:

```
import { Component } from '@angular/core';

@Component({
  moduleId: module.id,
  selector: 'app',
  templateUrl: 'app.component.html'
})

export class AppComponent {
  title: 'Freelance Bootcamp Dashboard'
}
```

## section 4 - building the document management component

### create a document management component - video 13

1. create the folder app/documents
2. in that folder create the file: documents.component.ts

```
import { Component } from '@angular/core';

@Component({
  moduleId: module.id,
  selector: 'documents',
  templateUrl: 'documents.component.html'
})

export class DocumentsComponent {
  
}
```

3. create the file: documents.component.html

```
<h1>Documents</h1>
```

4. in app-routing.module.ts add the documents components

```
import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

import { HomepageComponent } from './homepage/homepage.component';
import { DocumentsComponent } from './documents/documents.component';

const routes: Routes = [
  { path: '', redirectTo: '/home', pathMatch: 'full' },
  { path: 'home', component: HomepageComponent },
  { path: 'documents', component: DocumentsComponent }
]

@NgModule({
  imports: [ RouterModule.forRoot(routes) ],
  exports: [ RouterModule ]
})
export class AppRoutingModule {}
```

5. in app.module add the documents conponent

```
import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppComponent } from './app.component';
import { HomepageComponent } from './homepage/homepage.component';
import { DocumentsComponent } from './documents/documents.component';

import { AppRoutingModule } from './app-routing.module';


@NgModule({
  imports: [
    BrowserModule,
    AppRoutingModule
  ],
  declarations: [
    AppComponent,
    HomepageComponent,
    DocumentsComponent
  ],
  bootstrap: [
    AppComponent
  ]
})
export class AppModule {}
```

6. in browser, go to localhost/documents, and the page should load

### Creating Links Between Pages in Angular

1. in the app.component.html file add the code

```
<h1>Navigation</h1>

<a routerLink="/home">Home</a>
<a routerLink="/documents">Docs</a>

<router-outlet></router-outlet>
```

2. test the links in browser

### Creating an Angular Interface to Model Data

1. in documents dir, create file: document.ts

```
export interface Document {
  title: string,
  description: string,
  file_url: string,
  updated_at: string,
  image_url: string
}
```

2. he used the snake case to match rails later on instead of camel case

### Creating Mock Data in an Angular 2 Application

1. in documents.component.ts add the code

```
import { Component } from '@angular/core';
import { Document } from './document';

@Component({
  moduleId: module.id,
  selector: 'documents',
  templateUrl: 'documents.component.html'
})

export class DocumentsComponent {
  documents: Document[] = [
    {
      title: "My First Doc",
      description: "asdfasdf asdfasdf",
      file_url: "http://google.com",
      updated_at: '11/11/16',
      image_url: 'http://google.com'
    },
    {
      title: "My Second Doc",
      description: "asdfasdf asdfasdf",
      file_url: "http://google.com",
      updated_at: '11/11/16',
      image_url: 'http://google.com'
    },
    {
      title: "My Third Doc",
      description: "asdfasdf asdfasdf",
      file_url: "http://google.com",
      updated_at: '11/11/16',
      image_url: 'http://google.com'
    }       
  ]
}
```

2. in documents.component.html add the code:

```
<h1>Documents</h1>

<div *ngFor="let doc of documents">
  <h3>{{ doc.title }}</h3>

  <em>{{ doc.description }}</em>

  <div>
    <a href="{{ doc.file_url}}">Download File</a>
  </div>

  <p>
    {{ doc.updated_at }}
  </p>

  <p>
    {{ doc.image_url }}
  </p>
  <hr>
</div>
```

### how to access component data from an angular view template

1. in documents.comp.ts, under 'export class Doc....' add:

```
pageTitle: string = "Document Dashboard"
```

2. in docum.com.html replace the h1 with 

```
<h1>{{ pageTitle }}</h1>
```

## section 5 - building the proposal component

### creating the initial proposal component

1. in app dir, create a proposal folder
2. create a file in there: proposal-list.component.ts

```
import { Component } from '@angular/core';

@Component({
  moduleId: module.id,
  selector: 'proposal-list',
  templateUrl: 'proposal-list.component.html'
})
export class ProposalListComponent {}
```

3. create the proposal-list.component.html

```
<h1>Proposal List</h1>
```

4. in app-routing add the import:

```
import { ProposalListComponent } from './proposal/proposal-list.component';
const routes: Routes = [
  { path: '', redirectTo: '/home', pathMatch: 'full' },
  { path: 'home', component: HomepageComponent },
  { path: 'documents', component: DocumentsComponent },
  { path: 'proposals', component: ProposalListComponent }
]

```

5. we did path 'proposals', because we can name it whatever we want
6. in app.module add:

```
import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppComponent } from './app.component';
import { HomepageComponent } from './homepage/homepage.component';
import { DocumentsComponent } from './documents/documents.component';
import { ProposalListComponent } from './proposal/proposal-list.component';

import { AppRoutingModule } from './app-routing.module';


@NgModule({
  imports: [
    BrowserModule,
    AppRoutingModule
  ],
  declarations: [
    AppComponent,
    HomepageComponent,
    DocumentsComponent,
    ProposalListComponent
  ],
  bootstrap: [
    AppComponent
  ]
})
export class AppModule {}
```

7. in app.comp.html add the nav:

```
<a routerLink="/proposals">Proposals</a>
```

### Creating an Angular 2 Data Model for Proposals

1. in proposal dir, create proposal.ts

```
export class Proposal {
  constructor(
    public id?: number,
    public customer?: string,
    public portfolio_url: string = 'http://',
    public tools?: string,
    public estimated_hours?: number,
    public hourly_rate?: number,
    public weeks_to_complete?: number,
    public client_email?: string
  ) {}
}
```

### Populating an Angular List View with Data

1. in the proposal-list.component.ts update the code to be:

```
import { Component } from '@angular/core';
import { Proposal } from './proposal';

@Component({
  moduleId: module.id,
  selector: 'proposal-list',
  templateUrl: 'proposal-list.component.html'
})
export class ProposalListComponent {
  proposalOne: Proposal = new Proposal(15, 'Abc Company', 'http://portfolio.jordanhudgens.com', 'Ruby on Rails', 150, 120, 15, 'jordan@devcamp.com'),
  proposalTwo: Proposal = new Proposal(99, 'XYZ Company', 'http://portfolio.jordanhudgens.com', 'Ruby on Rails', 150, 120, 15, 'jordan@devcamp.com'),
  proposalThree: Proposal = new Proposal(300, 'YYZ Company', 'http://portfolio.jordanhudgens.com', 'Ruby on Rails', 150, 120, 15, 'jordan@devcamp.com')

  proposals: Proposal[] = [
    this.proposalOne, 
    this.proposalTwo, 
    this.proposalThree
  ]
}
```

2. update the code in proposal-list.component.html

```
<h1>Proposal List</h1>

<div *ngFor="let proposal of proposals">
  {{proposal.id}} - {{proposal.customer}}: {{proposal.portfolio_url}}
</div>
```

### building an angular 2 component that will create new proposals

1. in proposal dir, create new file: proposal-new.component.ts

```
import { Component } from '@angular/core';

@Component({
  moduleId: module.id,
  selector: 'proposal-new',
  templateUrl: 'proposal-new.component.html'
})
export class ProposalNewComponent;

```

2. in app routing module:

```
import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

import { HomepageComponent } from './homepage/homepage.component';
import { DocumentsComponent } from './documents/documents.component';
import { ProposalListComponent } from './proposal/proposal-list.component';
import { ProposalNewComponent } from './proposal/proposal-new.component';

const routes: Routes = [
  { path: '', redirectTo: '/home', pathMatch: 'full' },
  { path: 'home', component: HomepageComponent },
  { path: 'documents', component: DocumentsComponent },
  { path: 'proposals', component: ProposalListComponent },
  { path: 'proposals/new', component: ProposalNewComponent }
]

@NgModule({
  imports: [ RouterModule.forRoot(routes) ],
  exports: [ RouterModule ]
})
export class AppRoutingModule {}
```

3. in app module:

```
import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppComponent } from './app.component';
import { HomepageComponent } from './homepage/homepage.component';
import { DocumentsComponent } from './documents/documents.component';
import { ProposalListComponent } from './proposal/proposal-list.component';
import { ProposalNewComponent } from './proposal/proposal-new.component';

import { AppRoutingModule } from './app-routing.module';


@NgModule({
  imports: [
    BrowserModule,
    AppRoutingModule
  ],
  declarations: [
    AppComponent,
    HomepageComponent,
    DocumentsComponent,
    ProposalListComponent,
    ProposalNewComponent
  ],
  bootstrap: [
    AppComponent
  ]
})
export class AppModule {}
```

4. create the file proposal-new.component.html

```
<h1>Create a Proposal</h1>
```

5. update class in proposal-new.comp

```
import { Component } from '@angular/core';
import { Proposal } from './proposal';

@Component({
  moduleId: module.id,
  selector: 'proposal-new',
  templateUrl: 'proposal-new.component.html'
})
export class ProposalNewComponent{
  proposal = new Proposal;
}
``` 

6. update proposal-new.comp with:

```
<h1>Create a Proposal</h1>

<div>
  {{proposal.portfolio_url}}
</div>
```

7. refresh and the site should work, that last part was setting up to have the ability to add a form to create a new proposal

### Introduction to Angular 2 Forms

1. in app.module add the forms info

```
import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { FormsModule } from '@angular/forms';

import { AppComponent } from './app.component';
import { HomepageComponent } from './homepage/homepage.component';
import { DocumentsComponent } from './documents/documents.component';
import { ProposalListComponent } from './proposal/proposal-list.component';
import { ProposalNewComponent } from './proposal/proposal-new.component';

import { AppRoutingModule } from './app-routing.module';


@NgModule({
  imports: [
    BrowserModule,
    AppRoutingModule,
    FormsModule
  ],
  declarations: [
    AppComponent,
    HomepageComponent,
    DocumentsComponent,
    ProposalListComponent,
    ProposalNewComponent
  ],
  bootstrap: [
    AppComponent
  ]
})
export class AppModule {}
```

2. in proposal-new.comp.html, create the form:

```
<h1>Create a Proposal</h1>

<div>
  <form #proposalForm="ngForm">
    <div class="form-group">
      <label for="customer">Customer Name</label>
      <input type="text"
              id="customer"
              placeholder="ABC Company" 
              required
              name="customer"
              #customer='ngModel'
              [(ngModel)]="proposal.customer" 
      >
    </div>
  </form>
</div>

<div>
  {{ proposal.customer }}
</div>
```

3. test out in browser, as you type customer name, it should update automatically

### completing the angular proposal form

1. heres the code for the proposal-new.comp.html

```
<h1>Create a Proposal</h1>

<div>
  <form #proposalForm="ngForm">
    <div class="form-group">
      <label for="customer">Customer Name</label>
      <input type="text"
              id="customer"
              placeholder="ABC Company"
              required
              name="customer"
              #customer='ngModel'
              [(ngModel)]="proposal.customer"
      >
      <div [hidden]="customer.valid || customer.pristine">
        Customer name is required
      </div>
    </div>

    <div class="form-group">
      <label for="portfolio_url">Portfolio URL</label>
      <input type="text"
              id="portfolio_url"
              required
              name="portfolio_url"
              #portfolio_url='ngModel'
              [(ngModel)]="proposal.portfolio_url"
      >
      <div [hidden]="portfolio_url.valid || portfolio_url.pristine">
        A Portfolio URL is required
      </div>
    </div>

    <div class="form-group">
      <label for="tools">Tools that you'll use on the project</label>
      <input type="text"
              id="tools"
              placeholder="Ruby on Rails, Angular, etc"
              required
              name="tools"
              #tools='ngModel'
              [(ngModel)]="proposal.tools"
      >
      <div [hidden]="tools.valid || tools.pristine">
        A list of tools is required
      </div>
    </div>

    <div class="form-group">
      <label for="estimated_hours">Estimated hours</label>
      <input type="number"
              id="estimated_hours"
              required
              name="estimated_hours"
              #estimated_hours='ngModel'
              [(ngModel)]="proposal.estimated_hours"
      >
      <div [hidden]="estimated_hours.valid || estimated_hours.pristine">
        You need to enter your estimated hours for the project
      </div>
    </div>

    <div class="form-group">
      <label for="hourly_rate">Hourly rate</label>
      <input type="number"
              id="hourly_rate"
              required
              name="hourly_rate"
              #hourly_rate='ngModel'
              [(ngModel)]="proposal.hourly_rate"
      >
      <div [hidden]="hourly_rate.valid || hourly_rate.pristine">
        You need to enter your hourly rate for the project
      </div>
    </div>

    <div class="form-group">
      <label for="weeks_to_complete">Weeks to Complete</label>
      <input type="number"
              id="weeks_to_complete"
              required
              name="weeks_to_complete"
              #weeks_to_complete='ngModel'
              [(ngModel)]="proposal.weeks_to_complete"
      >
      <div [hidden]="weeks_to_complete.valid || weeks_to_complete.pristine">
        You need to enter the weeks you estimate to complete the project
      </div>
    </div>

    <div class="form-group">
      <label for="client_email">Client Email <em>(Optional)</em></label>
      <input type="email"
              id="client_email"
              name="client_email"
              #client_email='ngModel'
              [(ngModel)]="proposal.client_email"
      >
    </div>

  </form>
</div>

<div>
  <p>Hi {{ proposal.customer }},</p>


  <p>It was a pleasure getting to meet with you and review your project requirements, I believe it is a great fit for the types of applications that I build out. Please feel free to check out some of my past projects <a href="{{ proposal.portfolio_url }}" target="_blank">here</a>.</p>


  <p>To successfully build out the application I will be utilizing {{ proposal.tools }}, and a number of other tools to ensure that the project follows industry wide best practices.</p>


  <p>Ensuring that you are fully informed is one of my top priorities, so in addition to incorporating everything that we discussed, I will also be creating a project management dashboard and sending you a project update message daily so that you can have a transparent view of the development as it takes place.</p>


  <p>To accomplish the project and meet the requirements that we discussed, I am estimating that it will take {{ proposal.estimated_hours }} hours in development time to complete. The project should take {{ proposal.weeks_to_complete }} weeks to complete and with my hourly rate of {{ proposal.hourly_rate }}/hour, the estimated total will be {{ proposal.hourly_rate * proposal.estimated_hours }}.</p>


  <p>The next step from here is to set up a meeting to finalize the project and sign contracts.</p>


  <p>I am excited to working with you and build out this project.</p>
</div>
```

### how to implement dynamic data validations in angular 2

1. in the proposal-new.comp.html, he added the 'hidden' fields that are up in the code before

```
<div [hidden]="customer.valid || customer.pristine">
  Customer name is required
</div>
```

### creating dynamic routes in angular 2 based on an ID lookup

1. in proposal dir, create file: proposal-show.component.ts

```
import { Component } from '@angular/core';

@Component({
  moduleId: module.id,
  selector: 'proposal-show',
  templateUrl: 'proposal-show.component.html'
})
export class ProposalShowComponent {}
```

2. in proposal dir, create the file: proposal-show.component.html

```
<h1>Proposal Show</h1>
```

3. in app module, add proposal show:

```
import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { FormsModule } from '@angular/forms';

import { AppComponent } from './app.component';
import { HomepageComponent } from './homepage/homepage.component';
import { DocumentsComponent } from './documents/documents.component';
import { ProposalListComponent } from './proposal/proposal-list.component';
import { ProposalNewComponent } from './proposal/proposal-new.component';
import { ProposalShowComponent } from './proposal/proposal-show.component';

import { AppRoutingModule } from './app-routing.module';


@NgModule({
  imports: [
    BrowserModule,
    AppRoutingModule,
    FormsModule
  ],
  declarations: [
    AppComponent,
    HomepageComponent,
    DocumentsComponent,
    ProposalListComponent,
    ProposalNewComponent,
    ProposalShowComponent
  ],
  bootstrap: [
    AppComponent
  ]
})
export class AppModule {}
```

4. in app routing, add the proposal info, and make the routes dynamic with /:id:

```
import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

import { HomepageComponent } from './homepage/homepage.component';
import { DocumentsComponent } from './documents/documents.component';
import { ProposalListComponent } from './proposal/proposal-list.component';
import { ProposalNewComponent } from './proposal/proposal-new.component';
import { ProposalShowComponent } from './proposal/proposal-show.component';

const routes: Routes = [
  { path: '', redirectTo: '/home', pathMatch: 'full' },
  { path: 'home', component: HomepageComponent },
  { path: 'documents', component: DocumentsComponent },
  { path: 'proposals', component: ProposalListComponent },
  { path: 'proposals/new', component: ProposalNewComponent },
  { path: 'proposal/:id', component: ProposalShowComponent }
]

@NgModule({
  imports: [ RouterModule.forRoot(routes) ],
  exports: [ RouterModule ]
})
export class AppRoutingModule {}
```

### how to trigger 'active' classes in angular 2 views

1. in prop-show.comp.ts update the code:

```
import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Params } from '@angular/router';
import { Proposal } from './proposal';

@Component({
  moduleId: module.id,
  selector: 'proposal-show',
  templateUrl: 'proposal-show.component.html'
})
export class ProposalShowComponent implements OnIni {
  id: number;
  routeId: any;

  constructor(
    private route: ActivatedRoute
  ) {}

  ngOnInit(): void {
    this.routeId = this.route.params.subscribe(
      params => {
        this.id = +params['id'];
      }
    )
  }
}
```

2. in proposal-show.comp.html

```
<h1>Proposal Show</h1>

<div>
  The id for this proposal is: {{ id }}
</div>

```

3. in broswer type: localhost/proposal/15, and we should see the id on the page
4. in proposal-list.comp.html add code:

```
<h1>Proposal List</h1>

<div *ngFor="let proposal of proposals">
  <a routerLink="/proposal/{{proposal.id}}">{{proposal.id}} - {{proposal.customer}}: {{proposal.portfolio_url}}</a>
</div>
```

## section 6 - integrating bootstrap 4 in an angular 2 application

### installing bootstrap 4 into an angular 2 application with ng-bootstrap

1. [ng-bootstrap](https://ng-bootstrap.github.io/#/home)
2. stop server
3. in terminal sudo npm install --save @ng-bootstrap/ng-bootstrap
4. in app.module import bootstrap

```
import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { FormsModule } from '@angular/forms';
import { NgbModule } from '@ng-bootstrap/ng-bootstrap';

import { AppComponent } from './app.component';
import { HomepageComponent } from './homepage/homepage.component';
import { DocumentsComponent } from './documents/documents.component';
import { ProposalListComponent } from './proposal/proposal-list.component';
import { ProposalNewComponent } from './proposal/proposal-new.component';
import { ProposalShowComponent } from './proposal/proposal-show.component';

import { AppRoutingModule } from './app-routing.module';


@NgModule({
  imports: [
    BrowserModule,
    AppRoutingModule,
    FormsModule,
    NgbModule.forRoot()
  ],
  declarations: [
    AppComponent,
    HomepageComponent,
    DocumentsComponent,
    ProposalListComponent,
    ProposalNewComponent,
    ProposalShowComponent
  ],
  bootstrap: [
    AppComponent
  ]
})
export class AppModule {}
```

5. in the systemjs.config.js, in the 'map;' section, add at the end:

```
'@ng-bootstrap/ng-bootstrap': 'node_modules/@ng-bootstrap/ng-bootstrap/bundles/ng-bootstrap.js'
```

6. npm start, to start the server
7. in the html add in the head section:

```
<link rel="stylesheet" href="http://v4-alpha.getbootstrap.com/dist/css/bootstrap.min.css" />
```

8. i got a bunch of errors, in terminal I did

```
npm install npm -g
npm install --update-binary 
```

9. **The app wasnt working, unless I commented out NgbModule, waiting for jordan response**
10. **he responded suggested to use the package.json from his repo or update to 4 or 5, I updated to 5 [from this site](https://stackoverflow.com/questions/46497743/update-to-angular-5)**


### How to Set Universal Styles in an Angular 2 Application

1. at the route, where index.html is, create: styles.css

```
body {
  background-color: #252830;
}
```

2. in index.html add the stylesheet

```
<link rel="stylesheet" href="styles.css" />
```

### Creating a Bootstrap 4 Navigation Bar

1. in app.comp.html, update the navbar to be:

```
<nav class="navbar navbar-toggleable-md navbar-light bg-faded nav-styles">
  <div class='container'> 
    <ul class="nav navbar-nav">
      <li class='nav-item'>
        <a class='nav-link' routerLink="/home">Home</a>
      </li>
      <li class='nav-item'>
        <a class='nav-link' routerLink="/documents">Docs</a>
      </li>
      <li class="nav-item dropdown">
        <div ngbDropdown class="d-inline-block dropdown-links">
          <button class="btn btn-outline-primary" id="proposalDropdown" ngbDropdownToggle>
            Proposals
          </button>
          <div class="dropdown-menu" aria-labelledby="proposalDropdown">
            <a class="dropdown-item" routerLink="/proposals">Proposals</a>
            <a class="dropdown-item" routerLink="/proposals/new">New Proposal</a>
          </div>
        </div>
      </li>
    </ul>
  </div>
</nav>

<router-outlet></router-outlet>
```

### how to dynamically add css classes in an angular 2 view

1. in app.comp.html, update the links to be:

```
<nav class="navbar navbar-toggleable-md navbar-light bg-faded nav-styles">
  <div class='container'> 
    <ul class="nav navbar-nav">
      <li class='nav-item'>
        <a class='nav-link' routerLink="/home" routerLinkActive="active">Home</a>
      </li>
      <li class='nav-item'>
        <a class='nav-link' routerLink="/documents" routerLinkActive="active">Docs</a>
      </li>
      <li>
        <div ngbDropdown class="d-inline-block dropdown-links dropdown">
          <button class="btn btn-outline-primary" id="proposalDropdown" ngbDropdownToggle>
            Proposals
          </button>
          <div class="dropdown-menu" aria-labelledby="proposalDropdown">
            <a class="dropdown-item" routerLink="/proposals" routerLinkActive="active" [routerLinkActiveOptions]="{ exact: true }">Proposals</a>
            <a class="dropdown-item" routerLink="/proposals/new" routerLinkActive="active">New Proposal</a>
          </div>
        </div>
      </li>
    </ul>
  </div>
</nav>

<div class="app-body">
  <router-outlet></router-outlet>
</div>
```

### Using Bootstrap Cards in an Angular Application

1. in docu.comp.html replace code with the bootstrap card

```
<div class='container'>
  <h1 class="headline">{{ pageTitle }}</h1>

  <div class="card" *ngFor="let doc of documents">
    <img class="card-img-top" src="{{ doc.image_url }}" alt="Card image cap" width="100%">

    <div class="card-block">
      <h4 class="card-title">{{ doc.title }}</h4>

      <p class="card-text">{{ doc.description }}</p>

      <div>
        <a class="btn btn-lg btn-primary" href="{{ doc.file_url }}">Download File</a>
      </div>

      <p class="card-text"><small class="text-muted">{{ doc.updated_at }}</small></p>

    </div>

  </div>

</div>
```

2. in doc.comp.ts, update the export class:

```
export class DocumentsComponent {
  pageTitle: string = "Document Dashboard"

  documents: Document[] = [
    {
      title: "My First Doc",
      description: 'asdfasdfasdf asdfasd',
      file_url: 'http://google.com',
      updated_at: '11/11/16',
      image_url: 'https://upload.wikimedia.org/wikipedia/commons/d/d5/Mistakes-to-avoid-when-hiring-freelancers.jpg',
    },
    {
      title: "My Second Doc",
      description: 'asdfasdfasdf asdfasd',
      file_url: 'http://google.com',
      updated_at: '11/11/16',
      image_url: 'https://upload.wikimedia.org/wikipedia/commons/d/d5/Mistakes-to-avoid-when-hiring-freelancers.jpg',
    },
    {
      title: "My Last Doc",
      description: 'asdfasdfasdf asdfasd',
      file_url: 'http://google.com',
      updated_at: '11/11/16',
      image_url: 'https://upload.wikimedia.org/wikipedia/commons/d/d5/Mistakes-to-avoid-when-hiring-freelancers.jpg',
    }
  ]
}
```

### Creating Angular 2 Component Specific CSS Files

1. in app.comp.ts, update the code:

```
import { Component } from '@angular/core';

@Component({
  moduleId: module.id,
  selector: 'app',
  templateUrl: 'app.component.html',
  styleUrls: ['app.component.css']
})

export class AppComponent {
  title: 'Freelance Bootcamp Dashboard'
}
```

2. in app dir, create file app.component.css

```
.app-body {
  margin-top: 80px;
}
```

3. in app.comp.html, add class around router outlet

```
<div class="app-body">
  <router-outlet></router-outlet>
</div>
```

4. in doc.comp.ts, update @compponent

```
@Component({
  moduleId: module.id,
  selector: 'documents',
  templateUrl: 'documents.component.html',
  styleUrls: ['documents.component.css']
})
```

5. in documents dir, create documents.component.css

```
.headline h1 {
  color: white;
}
```

### setting additional global styles for all application components in angular 2

1. create a app/styles folder, move styles.css theremove .headline to styles.css
2. in index.html update the stylesheet link to

```
<link rel="stylesheet" href="app/styles/styles.css" />
```

### how to override the default bootstrap 4 navigation styles

1. in app.comp.css update code to be

```
.app-body {
  margin-top: 80px;
}

.nav-styles {
  background-color: #1a1b22;
}

.nav-styles a {
  color: white;
}

.nav-styles a:hover {
  color: #c9c9c9;
}

.nav-link.active {
  color: #e64758 !important;
}

.dropdown-links a {
  color: #1a1b22;
}

.dropdown-links a:hover {
  color: #252830;
}
```

### Adding Styles to an Angular 2 Form

1. in  proposal-new.com.ts, add the css to @Component

```

import { Component } from '@angular/core';
import { Proposal } from './proposal';

@Component({
  moduleId: module.id,
  selector: 'proposal-new',
  templateUrl: 'proposal-new.component.html',
  styleUrls: ['proposal-new.component.css']
})
export class ProposalNewComponent {
  proposal = new Proposal;
}
```

2. create proposal-new-component.css

```
.form-container {
  padding: 30px;
}
```

3. update the code in proposal-new.component.html

```
<div class="card container form-container">
  <div class='row'>

    <div class="col-md-6">
      <h1>Create a Proposal</h1>

      <div>
        <form #proposalForm="ngForm">
          <div class="form-group">
            <label for="customer">Customer Name</label>
            <input type="text"
                    id="customer"
                    placeholder="ABC Company"
                    required
                    name="customer"
                    #customer='ngModel'
                    [(ngModel)]="proposal.customer"
            >
            <div [hidden]="customer.valid || customer.pristine"
                  class='alert alert-danger'
            >
              Customer name is required
            </div>
          </div>

          <div class="form-group">
            <label for="portfolio_url">Portfolio URL</label>
            <input type="text"
                    id="portfolio_url"
                    required
                    name="portfolio_url"
                    #portfolio_url='ngModel'
                    [(ngModel)]="proposal.portfolio_url"
            >
            <div [hidden]="portfolio_url.valid || portfolio_url.pristine"
                  class='alert alert-danger'
            >
              A Portfolio URL is required
            </div>
          </div>

          <div class="form-group">
            <label for="tools">Tools that you'll use on the project</label>
            <input type="text"
                    id="tools"
                    placeholder="Ruby on Rails, Angular, etc"
                    required
                    name="tools"
                    #tools='ngModel'
                    [(ngModel)]="proposal.tools"
            >
            <div [hidden]="tools.valid || tools.pristine"
                  class='alert alert-danger'
            >
              A list of tools is required
            </div>
          </div>

          <div class="form-group">
            <label for="estimated_hours">Estimated hours</label>
            <input type="number"
                    id="estimated_hours"
                    required
                    name="estimated_hours"
                    #estimated_hours='ngModel'
                    [(ngModel)]="proposal.estimated_hours"
            >
            <div [hidden]="estimated_hours.valid || estimated_hours.pristine"
                  class='alert alert-danger'
            >
              You need to enter your estimated hours for the project
            </div>
          </div>

          <div class="form-group">
            <label for="hourly_rate">Hourly rate</label>
            <input type="number"
                    id="hourly_rate"
                    required
                    name="hourly_rate"
                    #hourly_rate='ngModel'
                    [(ngModel)]="proposal.hourly_rate"
            >
            <div [hidden]="hourly_rate.valid || hourly_rate.pristine"
                  class='alert alert-danger'
            >
              You need to enter your hourly rate for the project
            </div>
          </div>

          <div class="form-group">
            <label for="weeks_to_complete">Weeks to Complete</label>
            <input type="number"
                    id="weeks_to_complete"
                    required
                    name="weeks_to_complete"
                    #weeks_to_complete='ngModel'
                    [(ngModel)]="proposal.weeks_to_complete"
            >
            <div [hidden]="weeks_to_complete.valid || weeks_to_complete.pristine"
                  class='alert alert-danger'
            >
              You need to enter the weeks you estimate to complete the project
            </div>
          </div>

          <div class="form-group">
            <label for="client_email">Client Email <em>(Optional)</em></label>
            <input type="email"
                    id="client_email"
                    name="client_email"
                    #client_email='ngModel'
                    [(ngModel)]="proposal.client_email"
            >
          </div>

        </form>
      </div>
    </div>

    <div class="col-md-6">
      <div>
        <p>Hi {{ proposal.customer }},</p>


        <p>It was a pleasure getting to meet with you and review your project requirements, I believe it is a great fit for the types of applications that I build out. Please feel free to check out some of my past projects <a href="{{ proposal.portfolio_url }}">here</a>.</p>


        <p>To successfully build out the application I will be utilizing {{ proposal.tools }}, and a number of other tools to ensure that the project follows industry wide best practices.</p>


        <p>Ensuring that you are fully informed is one of my top priorities, so in addition to incorporating everything that we discussed, I will also be creating a project management dashboard and sending you a project update message daily so that you can have a transparent view of the development as it takes place.</p>


        <p>To accomplish the project and meet the requirements that we discussed, I am estimating that it will take {{ proposal.estimated_hours }} hours in development time to complete. The project should take {{ proposal.weeks_to_complete }} weeks to complete and with my hourly rate of {{ proposal.hourly_rate }}/hour, the estimated total will be {{ proposal.hourly_rate * proposal.estimated_hours }}.</p>


        <p>The next step from here is to set up a meeting to finalize the project and sign contracts.</p>


        <p>I am excited to working with you and build out this project.</p>
      </div>
    </div>
    
  </div>
</div>
```

### how to style dynamic validation messages in angular 2

1. in prop-new.comp.html, update the hidden code to have a css class

```
<div [hidden]="customer.valid || customer.pristine"
                  class='alert alert-danger'
            >
```

### How to Style Form Inputs with Bootstrap 4 Styles

1. in proposal-new.comp.html, to each input, add class: 'form-control'        `

```
<div class="card container form-container">
  <div class='row'>

    <div class="col-md-6">
      <h1>Create a Proposal</h1>

      <div>
        <form #proposalForm="ngForm">
          <div class="form-group">
            <label for="customer">Customer Name</label>
            <input type="text"
                    class="form-control"
                    id="customer"
                    placeholder="ABC Company"
                    required
                    name="customer"
                    #customer='ngModel'
                    [(ngModel)]="proposal.customer"
            >
            <div [hidden]="customer.valid || customer.pristine"
                  class='alert alert-danger'
            >
              Customer name is required
            </div>
          </div>

          <div class="form-group">
            <label for="portfolio_url">Portfolio URL</label>
            <input type="text"
                    class="form-control"
                    id="portfolio_url"
                    required
                    name="portfolio_url"
                    #portfolio_url='ngModel'
                    [(ngModel)]="proposal.portfolio_url"
            >
            <div [hidden]="portfolio_url.valid || portfolio_url.pristine"
                  class='alert alert-danger'
            >
              A Portfolio URL is required
            </div>
          </div>

          <div class="form-group">
            <label for="tools">Tools that you'll use on the project</label>
            <input type="text"
                    class="form-control"
                    id="tools"
                    placeholder="Ruby on Rails, Angular, etc"
                    required
                    name="tools"
                    #tools='ngModel'
                    [(ngModel)]="proposal.tools"
            >
            <div [hidden]="tools.valid || tools.pristine"
                  class='alert alert-danger'
            >
              A list of tools is required
            </div>
          </div>

          <div class="form-group">
            <label for="estimated_hours">Estimated hours</label>
            <input type="number"
                    class="form-control"
                    id="estimated_hours"
                    required
                    name="estimated_hours"
                    #estimated_hours='ngModel'
                    [(ngModel)]="proposal.estimated_hours"
            >
            <div [hidden]="estimated_hours.valid || estimated_hours.pristine"
                  class='alert alert-danger'
            >
              You need to enter your estimated hours for the project
            </div>
          </div>

          <div class="form-group">
            <label for="hourly_rate">Hourly rate</label>
            <div class="input-group">
              <span class="input-group-addon">$</span>
              <input type="number"
                      class="form-control"
                      id="hourly_rate"
                      required
                      name="hourly_rate"
                      #hourly_rate='ngModel'
                      [(ngModel)]="proposal.hourly_rate"
              >
            </div>
              
            <div [hidden]="hourly_rate.valid || hourly_rate.pristine"
                  class='alert alert-danger'
            >
              You need to enter your hourly rate for the project
            </div>
          </div>

          <div class="form-group">
            <label for="weeks_to_complete">Weeks to Complete</label>
            <input type="number"
                    class="form-control"
                    id="weeks_to_complete"
                    required
                    name="weeks_to_complete"
                    #weeks_to_complete='ngModel'
                    [(ngModel)]="proposal.weeks_to_complete"
            >
            <div [hidden]="weeks_to_complete.valid || weeks_to_complete.pristine"
                  class='alert alert-danger'
            >
              You need to enter the weeks you estimate to complete the project
            </div>
          </div>

          <div class="form-group">
            <label for="client_email">Client Email <em>(Optional)</em></label>
            <input type="email"
                    class="form-control"
                    id="client_email"
                    name="client_email"
                    #client_email='ngModel'
                    [(ngModel)]="proposal.client_email"
            >
          </div>

        </form>
      </div>
    </div>

    <div class="col-md-6">
      <div>
        <p>Hi {{ proposal.customer }},</p>


        <p>It was a pleasure getting to meet with you and review your project requirements, I believe it is a great fit for the types of applications that I build out. Please feel free to check out some of my past projects <a href="{{ proposal.portfolio_url }}">here</a>.</p>


        <p>To successfully build out the application I will be utilizing {{ proposal.tools }}, and a number of other tools to ensure that the project follows industry wide best practices.</p>


        <p>Ensuring that you are fully informed is one of my top priorities, so in addition to incorporating everything that we discussed, I will also be creating a project management dashboard and sending you a project update message daily so that you can have a transparent view of the development as it takes place.</p>


        <p>To accomplish the project and meet the requirements that we discussed, I am estimating that it will take {{ proposal.estimated_hours }} hours in development time to complete. The project should take {{ proposal.weeks_to_complete }} weeks to complete and with my hourly rate of {{ proposal.hourly_rate }}/hour, the estimated total will be {{ proposal.hourly_rate * proposal.estimated_hours }}.</p>


        <p>The next step from here is to set up a meeting to finalize the project and sign contracts.</p>


        <p>I am excited to working with you and build out this project.</p>
      </div>
    </div>
    
  </div>
</div>
```

2. The hourly rate, we created an input-group and add a add for the $ dollar sign

### How to Integrate the List Group Component Styles in Angular 2

1. in prop-list.comp.html, change the code to be

```
<div class="container">
  <div class="list-group">
    <a class="list-group-item list-group-item-action active">
      <h1 class="headline">Proposal List</h1>
    </a>
    <span *ngFor="let proposal of proposals" class="list-group-item">
      <a routerLink="/proposal/{{proposal.id}}" class="proposal-link list-group-item-action">
        <h5 class="list-group-item-heading">{{proposal.customer}}</h5>
        <p class="list-group-item-text">
          {{ proposal.hourly_rate * proposal.estimated_hours }}
        </p>
      </a>
    </span>
  </div>
</div>


```

2. in proposal-list.component.ts add the css component

```
@Component({
  moduleId: module.id,
  selector: 'proposal-list',
  templateUrl: 'proposal-list.component.html',
  styleUrls: ['proposal-list.component.css']
})
```

3. create the file: proposal-list.component.css

```
.proposal-link:hover {
  text-decoration: none;
}
```

### How to Work with Angular 2 Pipes to Format Currencies

1. update the code in prop-list.comp.html; adding the 'pipe' character in the hourly rate
2. in the prop-new.comp.html, update the paragraph, to include the pipe dollar

```
<div class="col-md-6">
  <div>
    <p>Hi {{ proposal.customer }},</p>


    <p>It was a pleasure getting to meet with you and review your project requirements, I believe it is a great fit for the types of applications that I build out. Please feel free to check out some of my past projects <a href="{{ proposal.portfolio_url }}">here</a>.</p>


    <p>To successfully build out the application I will be utilizing {{ proposal.tools }}, and a number of other tools to ensure that the project follows industry wide best practices.</p>


    <p>Ensuring that you are fully informed is one of my top priorities, so in addition to incorporating everything that we discussed, I will also be creating a project management dashboard and sending you a project update message daily so that you can have a transparent view of the development as it takes place.</p>


    <p>To accomplish the project and meet the requirements that we discussed, I am estimating that it will take {{ proposal.estimated_hours }} hours in development time to complete. The project should take {{ proposal.weeks_to_complete }} weeks to complete and with my hourly rate of {{ proposal.hourly_rate }}/hour, the estimated total will be {{ proposal.hourly_rate * proposal.estimated_hours | currency:'USD':true:'.0' }}.</p>


    <p>The next step from here is to set up a meeting to finalize the project and sign contracts.</p>


    <p>I am excited to working with you and build out this project.</p>
  </div>
</div>
```   

### Final Style Changes to Angular Application

1. in hompage.comp.html, replace the code


```
<div class="container">
  <div class="jumbotron">
    <h1>Freelancer Dashboard</h1> 
    <p class="lead">Everything you need to manage your freelance business.</p>
  </div>
</div>
```

2. update prop-show.comp.html

```
<div class="container">
  <div class="card proposal-card">
    <h1>Proposal Show</h1>

    <div>
      The id for this proposal is: {{ id }}
    </div>
  </div>
</div>
```

3. in prop-show.comp.ts, add the stylesheet component

```
@Component({
  moduleId: module.id,
  selector: 'proposal-show',
  templateUrl: 'proposal-show.component.html',
  styleUrls: ['proposal-show.component.css']
})
```

4. create the prop-show.comp.css

```
.proposal-card {
  padding: 30px;
}
```

### How to Add a Custom Font to an Angular 2 Application

1. in google, find the font you want to use, click 'select this font'; a little window pops up in the bottom; choose the 'link href', then grab the 'font-family' code

2. in index.html place above styles.css and below bootstrap

```
<link rel="stylesheet" href="http://v4-alpha.getbootstrap.com/dist/css/bootstrap.min.css" />
<link href="https://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet">
<link rel="stylesheet" href="app/styles/styles.css" />
```    

3. in styles css add the font-family

```
body {
  background-color: #252830;
  font-family: 'Ubuntu', sans-serif;
}

.headline {
  color: white;
}
```

## Creating a Ruby on Rails Microservice to Manage Documents

### Generating a Rails 5 API Application from Scratch

1. open the postgres app, to make sure the database is listening
2. in the angular-rails dir as the app type: rails new freelance_camp_documents --api -T -d postgresql
3. cd into the new rails dir
4. bundle install
5. rails db:create
6. rails g scaffold FreelanceDocument title:string description:string file_url:text image_url:text
7. subl .
8. rails db:migrate

### How to Generate Data in a Rails 5 Application

1. open the seeds file and add

```
# create_table "freelance_documents", force: :cascade do |t|
#     t.string   "title"
#     t.string   "description"
#     t.text     "file_url"
#     t.text     "image_url"
#     t.datetime "created_at",  null: false
#     t.datetime "updated_at",  null: false
#   end

10.times do |d|
  FreelanceDocument.create!(
    title: "Document #{d}",
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation",
    file_url: "https://docs.google.com/document/d/1UUgAob6ZpivgkgCbMD84JMMRc1flrzCPKybtQoAfASo/edit?usp=sharing",
    image_url: 'https://s3.amazonaws.com/devcamp-static/images/freelance-img.jpg'
  )
end
```
2. in terminal: bundle exec rake db:setup
3. rails c (I had an error loading the console, a student suggested to add in the development block in gem file: gem 'rb-readline', and it worked)
4. FreelanceDocument.last
5. rails s -p 3001
6. in browser: localhost:3001/freelance_documents
7. it worked!!!!!

### how to configure the network settings for a rails api app

1. to allow outside apps to access the api, we need to uncomment the "gem 'rack-cors'" gem in the gemfile
2. bundle install
3. go to config/initializers/cors.rb and add the code:

```
# Be sure to restart your server when you modify this file.

# Avoid CORS issues when API is called from the frontend app.
# Handle Cross-Origin Resource Sharing (CORS) in order to accept cross-origin AJAX requests.

# Read more: https://github.com/cyu/rack-cors

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins '*'

    resource '*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end
end
```

4. **if deployed to the web we would need to add in 'origins' the websites that are allowed to access this site, we put * to allow all**
5. rails s -p 3001 to make sure it is still running

## Connecting the Angular Front End with the Rails Document API App

### Creating an Angular 2 Service for Managing API Data

1. in app/documents, create: document.service.ts

```
import { Injectable } from '@angular/core';

@Injectable()
export class DocumentService {
  
}
```

2. in app.module.ts, import the document service and add a providers

```
import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { FormsModule } from '@angular/forms';
import { NgbModule } from '@ng-bootstrap/ng-bootstrap';

import { AppComponent } from './app.component';
import { HomepageComponent } from './homepage/homepage.component';
import { DocumentsComponent } from './documents/documents.component';
import { DocumentService } from './documents/document.service';
import { ProposalListComponent } from './proposal/proposal-list.component';
import { ProposalNewComponent } from './proposal/proposal-new.component';
import { ProposalShowComponent } from './proposal/proposal-show.component';

import { AppRoutingModule } from './app-routing.module';


@NgModule({
  imports: [
    BrowserModule,
    AppRoutingModule,
    FormsModule,
    NgbModule.forRoot()
  ],
  declarations: [
    AppComponent,
    HomepageComponent,
    DocumentsComponent,
    ProposalListComponent,
    ProposalNewComponent,
    ProposalShowComponent
  ],
  providers: [
    DocumentService
  ],
  bootstrap: [
    AppComponent
  ]
})
export class AppModule {}
```

### Introduction to Angular 2 Observables

1. we are using rxjs, which is [reaactivex](http://reactivex.io/)
2. update the code in document.service.ts

```
import { Injectable } from '@angular/core';
import { Http, Response, Headers, RequestOptions } from '@angular/http';
import { Observable } from 'rxjs/Rx';

import { Document } from './document';

@Injectable()
export class DocumentService {
  private documentsUrl = 'http://localhost:3001/freelance_documents.json';

  constructor(
    private http: Http
  ) {}

  getDocuments(): Observable<Document[]> {
    return this.http.get(this.documentsUrl)
                    .map((response: Response) => <Document[]>response.json())
                    .catch(this.handleError);
  }

  private handleError (error: Response | any) {
    // In a real world app, we might use a remote logging infrastructure
    let errMsg: string;
    if (error instanceof Response) {
      const body = error.json() || '';
      const err = body.error || JSON.stringify(body);
      errMsg = `${error.status} - ${error.statusText || ''} ${err}`;
    } else {
      errMsg = error.message ? error.message : error.toString();
    }
    console.error(errMsg);
    return Observable.throw(errMsg);
  }
}
```

### How to Render API Data in an Angular 2 Application

1. in app.module.ts, import the http

```
import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { FormsModule } from '@angular/forms';
import { HttpModule } from '@angular/http';
import { NgbModule } from '@ng-bootstrap/ng-bootstrap';

import { AppComponent } from './app.component';
import { HomepageComponent } from './homepage/homepage.component';
import { DocumentsComponent } from './documents/documents.component';
import { DocumentService } from './documents/document.service';
import { ProposalListComponent } from './proposal/proposal-list.component';
import { ProposalNewComponent } from './proposal/proposal-new.component';
import { ProposalShowComponent } from './proposal/proposal-show.component';

import { AppRoutingModule } from './app-routing.module';

@NgModule({
  imports: [
    BrowserModule,
    AppRoutingModule,
    FormsModule,
    NgbModule.forRoot(),
    HttpModule
  ],
  declarations: [
    AppComponent,
    HomepageComponent,
    DocumentsComponent,
    ProposalListComponent,
    ProposalNewComponent,
    ProposalShowComponent
  ],
  providers: [
    DocumentService
  ],
  bootstrap: [
    AppComponent
  ]
})
export class AppModule {}
```

2. in doc.comp.ts update the code to be

```
import { Component, OnInit } from '@angular/core';
import { Observable } from 'rxjs/Rx';
import { Document } from './document';
import { DocumentService } from './document.service';

@Component({
  moduleId: module.id,
  selector: 'documents',
  templateUrl: 'documents.component.html',
  styleUrls: ['documents.component.css'],
  providers: [ DocumentService ]
})
export class DocumentsComponent implements OnInit {
  pageTitle: string = "Document Dashboard"
  documents: Document[];
  errorMessage: string;
  mode = "Observable";

  constructor(
    private documentService: DocumentService;
  ) {}

  ngOnInit() {
    let timer = Observable.timer(0, 5000);
    timer.subscribe(() => this.getDocuments());
  }

  getDocuments() {
    this.documentService.getDocuments()
        .subscribe(
          documents => this.documents = documents,
          error => this.errorMessage = <any>error
        );
  }
}
```

3. refresh browser and it should work!!!!!!s

### Analyzing Real Time Data Updates with an Angular + Rails System

1. in the rails freelance camp documents api, update the index query in the controller to be


```
  def index
    @freelance_documents = FreelanceDocument.order('created_at Desc')

    render json: @freelance_documents
  end
```

2. and the page should update automatically

### Final Style Changes to Angular 2 Document Component

1. in docu.comp.html, update the 'updated at' with date pipe format

```
<div class='container'>
  <h1 class="headline">{{ pageTitle }}</h1>

  <div class="card" *ngFor="let doc of documents">
    <img class="card-img-top" src="{{ doc.image_url }}" alt="Card image cap" width="100%">

    <div class="card-block">
      <h4 class="card-title">{{ doc.title }}</h4>
      <p class="card-text"><small class="text-muted">Last updated: {{ doc.updated_at | date }}</small></p>
      <p class="card-text">{{ doc.description }}</p>

      <div>
        <a class="btn btn-lg btn-primary" href="{{ doc.file_url }}">Download File</a>
      </div>      

    </div>

  </div>

</div>
```

## Creating the Proposal Ruby on Rails Microservice API Application

### Building a Rails 5 API Microservice

1. in terminal, go to angular-rails dir and type: rails new freelance_camp_proposal --api -T -d postgresql
2. cd into new directory
3. bundle install
4. gemfile, uncomment: gem 'rack-cors'
5. bundle install
6. conifg/initializers/cors.rb update code to be:

```
# Be sure to restart your server when you modify this file.

# Avoid CORS issues when API is called from the frontend app.
# Handle Cross-Origin Resource Sharing (CORS) in order to accept cross-origin AJAX requests.

# Read more: https://github.com/cyu/rack-cors

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins '*'

    resource '*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end
end
```

### Using the Seeds File to Create Sample Data in a Rails 5 API App

1. in seeds add (we did this before g scaffold just to see what data types we needed to add)

```
10.times do |proposal|
  Proposal.create!(
    customer: "Customer #{proposal}",
    portfolio_url: 'http://portfolio.jordanhudgens.com',
    tools: 'Ruby on Rails, Angular 2, and Postgres',
    estimated_hours: (80 + proposal),
    hourly_rate: 120,
    weeks_to_complete: 12,
    client_email: 'jordan@devcamp.com',
  )
end
```

2. comment it out if not the scaffold won't work
3. in terminal: rails g scaffold Proposal customer:string portfolio_url:string tools:string estimated_hours:decimal hourly_rate:decimal weeks_to_complete:integer client_email:string
4. rails db:create
5. bundle exec rails db:migrate
6. verify the schema.rb to make sure the table was created
7. uncomment the seeds file
8. bundle exec rake db:setup (to seed the database)
9. rails c (failed again so I added "gem 'rb-readline'" to the development group in the gemfile)
10. bundle install
11. rails c
12. Proposal.last
13. rails s -p 3002
14. in browser localhost:3002/proposals (we should see the json)

## Connecting the Angular 2 App with the Rails Proposal Microservice

### Using an Angular 2 Observable to Stream Live Data for the Proposal List Componen

1. in app.module.ts import proposal services

```
import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { FormsModule } from '@angular/forms';
import { HttpModule } from '@angular/http';
import { NgbModule } from '@ng-bootstrap/ng-bootstrap';

import { AppComponent } from './app.component';
import { HomepageComponent } from './homepage/homepage.component';
import { DocumentsComponent } from './documents/documents.component';
import { DocumentService } from './documents/document.service';
import { ProposalListComponent } from './proposal/proposal-list.component';
import { ProposalNewComponent } from './proposal/proposal-new.component';
import { ProposalShowComponent } from './proposal/proposal-show.component';
import { ProposalService } from './proposal/proposal.service';

import { AppRoutingModule } from './app-routing.module';

@NgModule({
  imports: [
    BrowserModule,
    AppRoutingModule,
    FormsModule,
    NgbModule.forRoot(),
    HttpModule
  ],
  declarations: [
    AppComponent,
    HomepageComponent,
    DocumentsComponent,
    ProposalListComponent,
    ProposalNewComponent,
    ProposalShowComponent
  ],
  providers: [
    DocumentService,
    ProposalService
  ],
  bootstrap: [
    AppComponent
  ]
})
export class AppModule {}
```

2. in proposal dir, create proposal.service.ts

```
import { Injectable } from '@angular/core';
import { Http, Response, Headers, RequestOptions } from '@angular/http';
import { Observable } from 'rxjs/Rx';

import { Proposal } from './proposal';

@Injectable()
export class ProposalService {
  private proposalsUrl = 'http://localhost:3002/proposals.json';

  constructor(
    private http: Http
  ) {}

  getProposals(): Observable<Proposal[]> {
    return this.http.get(this.proposalsUrl)
                    .map((response: Response) => <Proposal[]>response.json())
                    .catch(this.handleError);
  }

  private handleError (error: Response | any) {
    // In a real world app, we might use a remote logging infrastructure
    let errMsg: string;
    if (error instanceof Response) {
      const body = error.json() || '';
      const err = body.error || JSON.stringify(body);
      errMsg = `${error.status} - ${error.statusText || ''} ${err}`;
    } else {
      errMsg = error.message ? error.message : error.toString();
    }
    console.error(errMsg);
    return Observable.throw(errMsg);
  }
}
```

3. in prop-list.comp.ts update the code

```
import { Component, OnInit } from '@angular/core';
import { Observable } from 'rxjs/Rx';
import { Proposal } from './proposal';
import { ProposalService } from './proposal.service';

@Component({
  moduleId: module.id,
  selector: 'proposal-list',
  templateUrl: 'proposal-list.component.html',
  styleUrls: ['proposal-list.component.css'],
  providers: [ ProposalService ]
})
export class ProposalListComponent implements OnInit {
  proposals: Proposal[];
  errorMessage: string;
  mode = "Observable";

  constructor(
    private proposalService: ProposalService
  ) {}

  ngOnInit() {
    let timer = Observable.timer(0, 5000);
    timer.subscribe(() => this.getProposals());
  }

  getProposals() {
    this.proposalService.getProposals()
        .subscribe(
          proposals => this.proposals = proposals,
          error => this.errorMessage = <any>error
        );
  }
}
```

4. browser refreshes, and the proposals should appear
5. rails c
6. Proposal.create!(customer: "Google", portfolio_url: 'http://portfolio.jordanhudgens.com', tools: 'Ruby on Rails, Angular 2, and Postgres', estimated_hours: 120, hourly_rate: 120, weeks_to_complete:12, client_email: 'buddylee939@hotmail.com')
7. it should have added it in the browser

### How to Implement an Angular 2 Show Page Component with API Data

1. we currently have a getproposals call in the proposal service, now we need a single proposal call
2. in prop.serv.ts update the code to be

```
import { Injectable } from '@angular/core';
import { Http, Response, Headers, RequestOptions } from '@angular/http';
import { Observable } from 'rxjs/Rx';

import { Proposal } from './proposal';

@Injectable()
export class ProposalService {
  private proposalsUrl = 'http://localhost:3002/proposals';

  constructor(
    private http: Http
  ) {}

  getProposals(): Observable<Proposal[]> {
    return this.http.get(this.proposalsUrl)
                    .map((response: Response) => <Proposal[]>response.json())
                    .catch(this.handleError);
  }

  getProposal(id: number) {
    return this.http.get(this.proposalsUrl + "/" + id + '.json');
  }

  private handleError (error: Response | any) {
    // In a real world app, we might use a remote logging infrastructure
    let errMsg: string;
    if (error instanceof Response) {
      const body = error.json() || '';
      const err = body.error || JSON.stringify(body);
      errMsg = `${error.status} - ${error.statusText || ''} ${err}`;
    } else {
      errMsg = error.message ? error.message : error.toString();
    }
    console.error(errMsg);
    return Observable.throw(errMsg);
  }
}
```

3. update the prop-show.comp.ts to be

```
import { Component, OnInit, Input } from '@angular/core';
import { ActivatedRoute, Params } from '@angular/router';
import { Http, Response, Headers, RequestOptions } from '@angular/http';
import { Observable } from 'rxjs/Rx';

import { Proposal } from './proposal';
import { ProposalService } from './proposal.service';

@Component({
  moduleId: module.id,
  selector: 'proposal-show',
  templateUrl: 'proposal-show.component.html',
  styleUrls: ['proposal-show.component.css'],
  providers: [ ProposalService ]
})
export class ProposalShowComponent implements OnInit {
  constructor(
    private http: Http,
    private proposalService: ProposalService,
    private route: ActivatedRoute
  ) {}

  @Input()
  proposal: Proposal;

  ngOnInit(): void {
    let proposalRequest = this.route.params
        .flatMap((params: Params) =>
          this.proposalService.getProposal(+params['id']));
    proposalRequest.subscribe(response => this.proposal = response.json());
  }
}
```

4. update prop-show.comp.html

```
<div class="container">
  <div *ngIf="proposal" class="card proposal-card">
    <h1>{{ proposal.customer }}</h1>

    <div class="col-md-12">
      <p>Hi {{ proposal.customer }},</p>


      <p>It was a pleasure getting to meet with you and review your project requirements, I believe it is a great fit for the types of applications that I build out. Please feel free to check out some of my past projects <a href="{{ proposal.portfolio_url }}">here</a>.</p>


      <p>To successfully build out the application I will be utilizing {{ proposal.tools }}, and a number of other tools to ensure that the project follows industry wide best practices.</p>


      <p>Ensuring that you are fully informed is one of my top priorities, so in addition to incorporating everything that we discussed, I will also be creating a project management dashboard and sending you a project update message daily so that you can have a transparent view of the development as it takes place.</p>


      <p>To accomplish the project and meet the requirements that we discussed, I am estimating that it will take {{ proposal.estimated_hours }} hours in development time to complete. The project should take {{ proposal.weeks_to_complete }} weeks to complete and with my hourly rate of {{ proposal.hourly_rate }}/hour, the estimated total will be {{ proposal.hourly_rate * proposal.estimated_hours | currency:'USD':true:'.0' }}.</p>


      <p>The next step from here is to set up a meeting to finalize the project and sign contracts.</p>


      <p>I am excited to working with you and build out this project.</p>
    </div>
  
  </div>
</div>
```

5. refresh and test out the proposal links, it should work

### How to Build a Custom Link Function in an Angular 2 Component

1. in prop-list.comp.ts we are going to create a function to replace the link in the html, so it doesnt have interpolation directly on the link, we imported the 'router' up top

2. update prop-list.comp.ts

```
import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Observable } from 'rxjs/Rx';
import { Proposal } from './proposal';
import { ProposalService } from './proposal.service';

@Component({
  moduleId: module.id,
  selector: 'proposal-list',
  templateUrl: 'proposal-list.component.html',
  styleUrls: ['proposal-list.component.css'],
  providers: [ ProposalService ]
})
export class ProposalListComponent implements OnInit {
  proposals: Proposal[];
  errorMessage: string;
  mode = "Observable";

  constructor(
    private proposalService: ProposalService,
    private router: Router
  ) {}

  ngOnInit() {
    let timer = Observable.timer(0, 5000);
    timer.subscribe(() => this.getProposals());
  }

  getProposals() {
    this.proposalService.getProposals()
        .subscribe(
          proposals => this.proposals = proposals,
          error => this.errorMessage = <any>error
        );
  }

  goToShow(proposal: Proposal): void {
    let link = ['/proposal', proposal.id];
    this.router.navigate(link);
  }
}
```

3. update prop-list.comp.html to have the (click)

```
<div class="container">
  <div class="list-group">
    <a class="list-group-item list-group-item-action active">
      <h1 class="headline">Proposal List</h1>
    </a>
    <span *ngFor="let proposal of proposals" class="list-group-item">
      <a (click)="goToShow(proposal)" class="proposal-link list-group-item-action">
        <h5 class="list-group-item-heading">{{proposal.customer}}</h5>
        <p class="list-group-item-text">
          {{ proposal.hourly_rate * proposal.estimated_hours | currency:'USD':true:'.0' }}
        </p>
      </a>
    </span>
  </div>
</div>
```

### Creating an Angular 2 Form Submit Button

1. in prop-new.comp.html add a button before the form closing tag (it will be disable until the form is valid, and once clicked, it disappears and displays text)

```
<button type="submit" 
  class="btn btn-outline-primary btn-lg"
  [disabled]="!proposalForm.form.valid"
  [hidden]="submitted"
>
  Generate Proposal
</button>
```

2. in proposal-new.comp.ts create the 'submitted'

```
export class ProposalNewComponent {
  proposal = new Proposal;
  submitted: boolean = true;
}
```

3. to test if it is working, change the boolean to true

```
export class ProposalNewComponent {
  proposal = new Proposal;
  submitted: boolean = true;
}
```

4. the button should disappear, put it back to false

### How to Create New Records in a Rails API from an Angular App

1. in prop.serv.ts, add the createProposal function

```
import { Injectable } from '@angular/core';
import { Http, Response, Headers, RequestOptions } from '@angular/http';
import { Observable } from 'rxjs/Rx';

import { Proposal } from './proposal';

@Injectable()
export class ProposalService {
  private proposalsUrl = 'http://localhost:3002/proposals';

  constructor(
    private http: Http
  ) {}

  getProposals(): Observable<Proposal[]> {
    return this.http.get(this.proposalsUrl)
                    .map((response: Response) => <Proposal[]>response.json())
                    .catch(this.handleError);
  }

  getProposal(id: number) {
    return this.http.get(this.proposalsUrl + "/" + id + '.json');
  }

  createProposal(proposal) {
    let headers = new Headers({ 'Content-Type': 'application/json'});
    let options = new RequestOptions({ headers: headers });
    return this.http.post(this.proposalsUrl, JSON.stringify(proposal), { headers: headers}).map((res: Response) => res.json());
  }

  private handleError (error: Response | any) {
    // In a real world app, we might use a remote logging infrastructure
    let errMsg: string;
    if (error instanceof Response) {
      const body = error.json() || '';
      const err = body.error || JSON.stringify(body);
      errMsg = `${error.status} - ${error.statusText || ''} ${err}`;
    } else {
      errMsg = error.message ? error.message : error.toString();
    }
    console.error(errMsg);
    return Observable.throw(errMsg);
  }
}
```

2. in prop-new.comp.ts import propserv and update all code

```
import { Component } from '@angular/core';
import { Observable } from 'rxjs/Rx';
import { Proposal } from './proposal';
import { ProposalService } from './proposal.service';

@Component({
  moduleId: module.id,
  selector: 'proposal-new',
  templateUrl: 'proposal-new.component.html',
  styleUrls: ['proposal-new.component.css'],
  providers: [ ProposalService ]
})
export class ProposalNewComponent {
  proposal = new Proposal;
  submitted: boolean = false;

  constructor(
    private proposalService: ProposalService
  ) {}

  createProposal(proposal) {
    this.submitted = true;
    this.proposalService.createProposal(proposal)
        .subscribe(
          data => { return true },
          error => {
            console.log("Error saving proposal");
            return Observable.throw(error);
          }
        );
  }
}
```

3. in prop-new.comp.html, update the form to submit the data

```
<div class="card container form-container">
  <div class='row'>

    <div class="col-md-6">
      <h1>Create a Proposal</h1>

      <div>
        <form (ngSubmit)="createProposal(proposal)" #proposalForm="ngForm">
          <div class="form-group">
            <label for="customer">Customer Name</label>
            <input type="text"
                    class="form-control"
                    id="customer"
                    placeholder="ABC Company"
                    required
                    name="customer"
                    #customer='ngModel'
                    [(ngModel)]="proposal.customer"
            >
            <div [hidden]="customer.valid || customer.pristine"
                  class='alert alert-danger'
            >
              Customer name is required
            </div>
          </div>

          <div class="form-group">
            <label for="portfolio_url">Portfolio URL</label>
            <input type="text"
                    class="form-control"
                    id="portfolio_url"
                    required
                    name="portfolio_url"
                    #portfolio_url='ngModel'
                    [(ngModel)]="proposal.portfolio_url"
            >
            <div [hidden]="portfolio_url.valid || portfolio_url.pristine"
                  class='alert alert-danger'
            >
              A Portfolio URL is required
            </div>
          </div>

          <div class="form-group">
            <label for="tools">Tools that you'll use on the project</label>
            <input type="text"
                    class="form-control"
                    id="tools"
                    placeholder="Ruby on Rails, Angular, etc"
                    required
                    name="tools"
                    #tools='ngModel'
                    [(ngModel)]="proposal.tools"
            >
            <div [hidden]="tools.valid || tools.pristine"
                  class='alert alert-danger'
            >
              A list of tools is required
            </div>
          </div>

          <div class="form-group">
            <label for="estimated_hours">Estimated hours</label>
            <input type="number"
                    class="form-control"
                    id="estimated_hours"
                    required
                    name="estimated_hours"
                    #estimated_hours='ngModel'
                    [(ngModel)]="proposal.estimated_hours"
            >
            <div [hidden]="estimated_hours.valid || estimated_hours.pristine"
                  class='alert alert-danger'
            >
              You need to enter your estimated hours for the project
            </div>
          </div>

          <div class="form-group">
            <label for="hourly_rate">Hourly rate</label>
            <div class="input-group">
              <span class="input-group-addon">$</span>
              <input type="number"
                      class="form-control"
                      id="hourly_rate"
                      required
                      name="hourly_rate"
                      #hourly_rate='ngModel'
                      [(ngModel)]="proposal.hourly_rate"
              >
            </div>
              
            <div [hidden]="hourly_rate.valid || hourly_rate.pristine"
                  class='alert alert-danger'
            >
              You need to enter your hourly rate for the project
            </div>
          </div>

          <div class="form-group">
            <label for="weeks_to_complete">Weeks to Complete</label>
            <input type="number"
                    class="form-control"
                    id="weeks_to_complete"
                    required
                    name="weeks_to_complete"
                    #weeks_to_complete='ngModel'
                    [(ngModel)]="proposal.weeks_to_complete"
            >
            <div [hidden]="weeks_to_complete.valid || weeks_to_complete.pristine"
                  class='alert alert-danger'
            >
              You need to enter the weeks you estimate to complete the project
            </div>
          </div>

          <div class="form-group">
            <label for="client_email">Client Email <em>(Optional)</em></label>
            <input type="email"
                    class="form-control"
                    id="client_email"
                    name="client_email"
                    #client_email='ngModel'
                    [(ngModel)]="proposal.client_email"
            >
          </div>

          <button type="submit"
            class='btn btn-outline-primary btn-lg'
            [disabled]="!proposalForm.form.valid"
            [hidden]="submitted"
          >
            Generate Proposal
          </button>

        </form>
      </div>
    </div>

    <div class="col-md-6">
      <div>
        <p>Hi {{ proposal.customer }},</p>


        <p>It was a pleasure getting to meet with you and review your project requirements, I believe it is a great fit for the types of applications that I build out. Please feel free to check out some of my past projects <a href="{{ proposal.portfolio_url }}">here</a>.</p>


        <p>To successfully build out the application I will be utilizing {{ proposal.tools }}, and a number of other tools to ensure that the project follows industry wide best practices.</p>


        <p>Ensuring that you are fully informed is one of my top priorities, so in addition to incorporating everything that we discussed, I will also be creating a project management dashboard and sending you a project update message daily so that you can have a transparent view of the development as it takes place.</p>


        <p>To accomplish the project and meet the requirements that we discussed, I am estimating that it will take {{ proposal.estimated_hours }} hours in development time to complete. The project should take {{ proposal.weeks_to_complete }} weeks to complete and with my hourly rate of {{ proposal.hourly_rate }}/hour, the estimated total will be {{ proposal.hourly_rate * proposal.estimated_hours | currency:'USD':true:'.0' }}.</p>


        <p>The next step from here is to set up a meeting to finalize the project and sign contracts.</p>


        <p>I am excited to working with you and build out this project.</p>
      </div>
    </div>
    
  </div>
</div>
```

4. refresh and try to add a new proposal
5. IT EFFIN WORKED!!!!!!!!!!!!!

## Final Application Changes

### How to Add Dynamic Notifications in an Angular 2 Application

1. in prop-new.comp.html, under the button add the code

```
<div 
  [hidden]="!submitted"
  class="alert alert-success"
  role="alert"
>
  Your proposal has been generated <a routerLink="/proposals">View all proposals</a>
</div>
```     

2. refresh and test out

### Adding Final Style Changes to the Proposal Show Component

1. in prop-show.comp.html, he got rid of the class

```
<div class="col-md-12">
```

### How to Trigger Sending Emails from the Rails Microservice

1. in terminal, rails proposal dir
2. rails g mailer ProposalMailer
3. in application_mailer.rb change the 'from' address

```
class ApplicationMailer < ActionMailer::Base
  default from: 'mailerbot@devcamp.com'
  layout 'mailer'
end

```

4. in proposal mailer.rb add the code

```
class ProposalMailer < ApplicationMailer
  def email(proposal)
    @proposal = proposal
    mail(to: @proposal.client_email, subject: "You're received a new proposal")
  end
end
```

5. in rails/app/views/proposal_mailer, create a file: email.text.erb

```
Hello <%= @proposal.customer %>
===============================

You have received a new proposal, to view it click the link below:

http://localhost:3000/proposal/<%= @proposal.id %>
```

6. in proposals controller update the create

```
  def create
    @proposal = Proposal.new(proposal_params)

    if @proposal.save
      ProposalMailer.email(@proposal).deliver_later
      render json: @proposal, status: :created, location: @proposal
    else
      render json: @proposal.errors, status: :unprocessable_entity
    end
  end
```

7. **for it to truly work, we have to set up an email server, see other course or action mailer guide**
8. refresh the new proposal and try it out, 
9. It worked for me

# **THE END**




<hr>

# [from the angular io docs](https://angular.io/tutorial/toh-pt3)

## how I converted an html template to angular

1. in terminal create app: ng new html-pure
2. once create, cd into the new dir
3. [from this tutorial](https://loiane.com/2017/08/how-to-add-bootstrap-to-an-angular-cli-project/)
3. npm install bootstrap --save
4. in the file .angular-cli.json update the styles to be

```
"styles": [
  "../node_modules/bootstrap/dist/css/bootstrap.min.css",
  "styles.css"
]
```

5. in src/styles.css

```
@import '~bootstrap/dist/css/bootstrap.min.css';
```

6. to add the javascript:
7. npm install ngx-bootstrap --save
8. (if you want to install both at the same time npm install bootstrap ngx-bootstrap --save)
9. [the ngx-bootstrap site](https://valor-software.com/ngx-bootstrap/#/)
10. in app.module.ts import the javascripts we want to use


```
import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { BsDropdownModule } from 'ngx-bootstrap/dropdown';
import { TooltipModule } from 'ngx-bootstrap/tooltip';
import { ModalModule } from 'ngx-bootstrap/modal';


import { AppComponent } from './app.component';


@NgModule({
  declarations: [
    AppComponent
  ],
  imports: [
    BrowserModule,
    BsDropdownModule.forRoot(),
    TooltipModule.forRoot(),
    ModalModule.forRoot()
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
```

11. (an alternative is to create app-bootstrap.module.ts, and import it there so as to not clutter the app module, look in tutorial)
12. 