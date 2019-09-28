# React Notes
Coding with Mosh - Super Cool Course


# BrowserRouter
Grabs history obkect in browser. Everywhere in component tree can see browserHistory

# Switch
Most specific first, then generertic
Can use exact

# Single page applications
SPA's
Not reloading entire page
Only update in content area

Link onClick prevents default behaviour of anchor
Handler only update url. Now url changed, then one of the routes will match and new component will be rendered.

# Router component
...wrapper around Home component

# Custom props
<Route
              path="/products"
              render={props => <Products sortBy="newest" {...props} />}
            />

#
Read params:
{…}
id:
"1"
Using match object

# Optionally expression
<Route path="/posts/:year?/:month?" component={Posts} />
Should try to avoid them

    this.props.history.replace("/products");
Often used when loging in

# History
<button
        className="btn btn-primary"
        onClick={() => history.push("/movies")}
      >
        Save
      </button>
If push to history, you will be sent to /movies, and I guess this will be added to you browser history

# Route parameters
Query string
redirect
not-found
nested routing
Building forms with validation

# REF to input field
    e.preventDefault();
Prevents form from submitting to server, which causes a full server reload.

Minimize use of REF. React.createRef()
	Manage focus of input feel.
	Animations
	Third party dom libraries

# Errors
    this.setState({ errors: errors || {} });
Allways set to state

# Joi is abort early error detection

Controller elements, cannot use null or undefiend. 


# Lodash 
	_.get(item, column.path)
	Will get value of item{column][path]

var object = { 'a': [{ 'b': { 'c': 3 } }] };
 
	_.get(object, 'a[0].b.c');
	// => 3
 
	_.get(object, ['a', '0', 'b', 'c']);
	// => 3
 
	_.get(object, 'a.b.c', 'default');
	// => 'default'


# CRUD 
npm i axios@0.18

# Promise
Holds result of an asynchronouse operation
Will complete in the future.

# 
PUT updating
Delete deleting
OPTIONS request. Since local webserver is hosted for localhost. When ajax domain always sends options request. 
POST - Creating data

PATCH update one or two properties.
PUT to update all properties

# Optimistick update
  handleUpdate = async post => {
    post.title = "UPDATED";
    await axios.put(apiEndpoint + "/" + post.id, post);

    const posts = [...this.state.posts];
    const index = posts.indexOf(post);
    posts[index] = { ...post };
    this.setState({ posts });
  };

Only have try catch block if you need to do something specific of error

# Add axios and toastify
npm i axios@0.18.0 react-toastify@4.1.0

# Various notes
Modularization is important

# Logging
Check out Sec 8 start vidly src services logService


# Code segments
# Notes

```javascript
import React, { Component } from "react";

class Counter extends Component {
  state = {
    count: 0
  };

  render() {
    return (
      <div>
        <span style={{ fontSize: 30 }} className="badge badge-primary m-2">
          {this.formatCount()}
        </span>
        <button className="btn btn-secondary btn-sm">Increment</button>
      </div>
    );
  }

  formatCount() {
    const { count } = this.state;
    return count === 0 ? "Zero" : count;
  }
}

export default Counter;
```

-------------
# Mastering React course notes

Babel modern javascript compiler
Convert to Javscript code browser can understand

Use JEX

## Virtual DOM

When state of
Will compare with previous and update difference

## Use eject only if you know what you are doing

## Course Structure

Javascript
Overview Javascript feature
Components
Composing. Pass data between, and interact
Tables
Pagination. Searching.
Forms. Validation

Routing and navigation
Take user form one page to antother
HTTP Services
Talk to back-end services
Store in MongoDB database
Authentication
As part of the back-end services
Custom authentication
Deployment
Will feel confident to develop own apps

## Modern Javascript essentials

Let / Const
Object
this
Arrow functions
Desctructuring
Spread
Classes
Modules

### Var / Let

var -> function
let -> block
const -> block

Functions are objects

### Bind Method

Set version of this permanently

### Arrow functions

Inherents this keyword in which the function is defined

Ecma script () => {}. If only one parameter don't need
const square = function(number) {
return number _ number;
};
const square = number => {
return number _ number;
};

const square = number => number \* number;

#### Perfect for filtering

const activeJobs = jobs.filter(function(job) { return job.isActive; });
const activeJobs = jobs.filter(job => job.isActive );

#### And this

Arrow function doesn't rebind 'this'
In callback, strict mode doesn't override functionallity.

### Arraw map

const colors = ["red", "green", "blue"];
const items = colors.map(color => `<li>${color}</li>`);

## Object Desctructuring

```javascript
const street = address.street;
const city = address.city;
const country = address.country;

const { street: st, city, country } = address;
```

## Spread operator

```javascript
const first = [1, 2, 3];
const second = [4, 5, 6];

const combined = first.concat(second);
const combined = [...first, "a", ...second, "b"];
const clone = [...first];

const first = { name: "Mosh" };
const second = { job: "Instructor" };
const combined = { ...first, ...second, location: "Austra" };
```

## Classes

```javascript
class Person {
  constructor(name) {
    this.name = name;
  }
  walk() {
    console.log("walk");
  }
}

class Teacher extends Person {
  constructor(name, degree) {
    super(name);
    this.degree = degree;
  }
  teach() {
    console.log("teach");
  }
}

const teacher = new Teacher("Mosh", "MSc");
```

## Modules
Modularity is good! Yeah. ECMA script 6 modules natively in Javascript. 

// Default -> import ... from '';
// Named -> import { ... } from '';


---------------------
# Additional notes

true && 'Hi'

## Weird stuff

	constructor() {
		super();
		this.handleIncrement = this.handleIncrement.bind(this);
	}

OR
	handleIncrement = () => {
		console.log("Increment clicked", this);
	};

Maybe not latest fix is able to be used

	renderTags() {
		if (this.state.tags.length === 0) return <p>There are no tags!</p>;
		return (
			<ul>
				{this.state.tags.map(tag => (
				<li key={tag}>{tag}</li>
				))}
			</ul>
		);
	}

## Pass argument to event handler

onClick={ () => this.handleIncrement(product)}

import React, { Component } from "react";

	class Counter extends Component {
	state = {
	count: 0
	};

	/_ constructor() {
	super();
	this.handleIncrement = this.handleIncrement.bind(this);
	} _/
	handleIncrement = product => {
	console.log(product);
	this.setState({ count: this.state.count + 1 });
	};

	render() {
	return (
	<div>
	<span className={this.getBadgeClasses()}>{this.formatCount()}</span>
	<button
	onClick={() => this.handleIncrement}
	className="btn btn-secondary btn-sm" >
	Increment
	</button>
	</div>
	);
	}

	getBadgeClasses() {
	let classes = "badge m-2 badge-";
	classes += this.state.count === 0 ? "warning" : "primary";
	return classes;
	}

	formatCount() {
	const { count } = this.state;
	return count === 0 ? "Zero" : count;
	}
	}

	export default Counter;

# Config
custom-environment-variables.json is a file for defining which environmental variables you should use
