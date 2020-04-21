# Routes

## CRUD Routes

| URL | HTTP Method | Controller | Method | Name | Response | Comment
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| /login | POST | authentification | login | login | 200 / 401 | connects a user |
| /logout | GET | authentification | logout | logout | 200 / 401 | disconnects a user |
| /signup | POST | authentification | signup | signup | 201 / 401 | creates a new account |
| /products | POST | products | create | create_product | 201 / 401 | creates a new product |
| /products/{:slug}  | PATCH | products | update | update_product | 200 / 401 | updates an user product |
| /products/{:slug} | DELETE | products | delete | delete_product | 204 / 401 | deletes a product |
| /admin/users/{:nickname} | PATCH | admin | update | admin_update_user | 200 / 401 | updates a  user |
| /admin/users/{:nickname} | DELETE | admin | delete | admin_delete_user | 204 / 401 | deletes a user |
| /admin/users | PATCH | AdminController | toggleUserStatus | api_toggle_user | 200 / 401 | bans or unbans a user |
| /article/{:slug} | POST | article | create | create_article | 201 / 401 | adds an article |
| /article/{:slug} | PATCH | article | update | update_article | 200 / 401 | updates a user's article |
| /article/{:slug} | DELETE | article | delete | delete_article | 204 / 401 | deletes a user's article |


## VIEW ROUTES

| URL | HTTP Method | Controller | Method | Name | Response | Comment
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| / | GET | home | home | home | 200 / 401 | HomePage - Needs /products + /types |
| /404 | GET | 404 | 404 | 404 | 404 | Ressource not found |
| /login | GET | authentification | login | login | 200 / 401 | connect page for an user |
| /signup | GET | authentification | signup | signup | 201 / 401 | form to create a new account |
| /products/{:slug} | GET | products | getOne | get_one_product | 200 / 404 | retrieves a particular product |
| /article/{:slug} | GET | article | getOne | get_one_article | 200 / 404 | Show an article linked to the product |
| /productors | GET | productors | getAll | get_productors | 200 / 404 | show all productors |
| /productors/{:slug} | GET | productors | getOne | get_one_productor | 200 / 404 | retrieves a particular productor |
| /profile | GET | user | getOne | get_one_user | 200 / 404 | retrieves a particular user |
| /profile/kart | GET | user | getUserProducts | get_user_products | 200 / 404 | Shows Kart |
| /admin/users | GET | admin | getAll | get_users | 200 / 404 | retrieves all users |
| /admin/users/{:nickname} | GET | admin | getOne | get_one_user | 200 / 404 | retrieves a particular user |