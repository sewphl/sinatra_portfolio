# Sinatra App

## Brief summary

#### goal
the goal of this lab was to build a CRUD MVC app using Sinatra. the requirements were as follows:

* build an MVC Sinatra application
* use ActiveRecord with Sinatra
* use multiple models
* use at least one `has_many` relationship on a `Customer` model and one `belongs_to` relationship on another model
* must have `Customer` accounts - `Customer` must be able to sign up, sign in, and sign out
* validate uniqueness of `Customer` login attribute
* once logged in, a `Customer` must have the ability to **create**, **read**, **update** and **destroy** the resource that `belongs_to` `Customer`.
* ensure that `Customers` can edit and delete only their own resources - not resources created by other `Customers`.
* validate `Customers` input so bad data cannot be persisted to the database.

#### brief overview
* overall plan: create an app that sells `Tinctures` (herbal products)
* when a viewer lands at the site, they can follow a link to view the `Tinctures`.
* in order to initiate an `Order`, the viewer must first become a `Customer` by signing up (or logging in, if they already are already a `Customer`).
* once logged in, a `Customer` `has_many` `Orders`, and an `Order` `belongs_to` a `Customer`.
* once the `Customer` **creates** a `cart`, they can **view** it, **update** it, or **delete** it.

## Submitting a Pull Request to Suggest an Improvement

To improve the app:

* fork this repository
* make the change on your fork, with descriptive commits in the standard format
* open a Pull Request against this repo

## License
https://opensource.org/licenses/MIT
