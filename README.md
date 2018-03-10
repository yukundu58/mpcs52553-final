# README

# MPCS 52553 Final Project of Yukun Du

# Live URL   https://yukun-webdev.herokuapp.com/

## Set Up
1. bundle install
2. rails db:migrate db:seed
3. rails server
4. browse 'localhost:3000'

## Reservation System of Uchicago Libraries

There are several libraries in University of Chicago and besides the public study zone, each library has its own group study or self-study rooms that we could book in advance.
So I want to build a room-book system for the teacher, staff and students in Uchicago.

There are three models: Library, User and Reservation.

## User Part
We also have a sign-in system and support two kinds of users: Administrator and non-administrator.
The administrators could
- change add new libraries
- delete libraries
- update libraries,
- see all the reservations.
The non-administrator could
- make reservations
- cancel reservations
- update their own profiles.

To get the access to edit and delete details of library, you should log in using administrator account (Username: yukun   Password: yukun), or you could sign up your
own account via admin_code: 52553.

## Library Part
This web application support Get the details of one library, Add Library, Edit library and Delete Library(if you sign in with administrator account).

## Reservation Part
Non-administrator users could make reservation by click each library, and they could also cancel the reservation.
Administrator users have the access to see all the reservations.
There are some rules of reservation:
- On each time spot, the number of reservations of a specific library cannot be more than its room number
- One user cannot make two reservations having time overlap for one library
- The end time of one reservation should be later than its beginning time
