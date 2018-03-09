# README

# MPCS 52553 Final Project 
# Live URL https://yukun-webdev.herokuapp.com/

## Reservation System of Uchicago Libraries

There are several libraries in University of Chicago and besides the public study zone, each library has its own group study or self-study rooms that we could book in advance.
So I want to build a room-book system for the teacher, staff and students in Uchicago.

There are three models: Library, User and Reservation.

## User Part
We also have a sign-in system and support two kinds of users: Administrator and non-administrator. The administrators could change add new libraries, edit the number of available rooms of each library and limit the right of book right for a specific user. The non-administrator could make reservation for the room of specific library.

To get the access to edit and delete details of library, you should log in using administrator account (Username: yukun   Password: yukun), or you could sign up your
own account via admin_code: 52553.

## Library Part
This web application support Get the details of one library, Add Library, Edit library and Delete Library(if you sign in with administrator account).

## Reservation Part
Non-administrator users could make reservation by click each library, and they could also cancel the reservation.
Administrator users have the access to see all the reservations.
