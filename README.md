# Nested Hashes Lab

## Learning Goals

1. Recognize vocabulary term: "array of hashes" ("AoH")
2. Recognize that "arrays of hashes" are contact lists or spreadsheets
3. Create an `Array` of `Hash`es
4. Read scalar data from an `Array` of `Hash`es
5. Modify scalar data in an `Array` of `Hash`es

## Introduction

Having worked with `Array`s of `Array`s, you're going to be pleasantly
surprised that most of the syntax works exactly the same between "arrays of
arrays" to "arrays of hashes."

### Key Image: Contact List or Spreadsheet

To help you when reading the rest of this lesson, keep in mind that an `Array` of
`Hash`es is well expressed by a contact list (or, if you're old enough, a
Rolodex). Take a card, add some standard fields to it (first name, family name,
phone number, fax number, email address, etc.) and fill the fields in. Take
another card and do the same. Take another card and do the same. Those three
cards could go in an `Array`, an `Array` of `Hash`es.

If you think about a contact list, it's also easy to export it to a spreadsheet
like a Google Sheet or an Excel Sheet. You could take the fields on the card
and make them the columns across the top of the spreadsheet. Then for each
member of the contact list you could make a new row for it.

Oftentimes when a business friend who doesn't know how to code asks for
programming help, they'll want to give us data out of a spreadsheet. Our first
move is to turn that spreadsheet into an AoH.

### From Hash to Array of Hashes

Recall that a `Hash` is like a table, but in code form. It is a way for your
program to store pairs of data as elements in a collection.

We call names in a `Hash` that we use to point to data, _keys_. By providing a
`Hash` name and a _key_, we can uniquely identify a _value_.

Multiple `Hash`es inside of an Array would mean you could find the zeroth,
first, second, etc. element of that `Array` and get back a little dictionary.
You could then ask that dictionary for the `:family_name` field's content and
get back "Smith" or "Huang" or "Dayal."

## Recognize Vocabulary Term: "Array of Hashes"

Nested `Hash`es have been common data structures since at least Alexandrian
Egypt (the library there famously had books of locations of books). As such,
there are lots of words that mean "Array of Hashes." Here's a quick reference.
You don't need to memorize these, but if you're trying to model a problem as a
programmer, you might see someone use these words.

* **AoH**: **A**rray **o**f **H**ashes
* **field**: The key / value pair of a Hash e.g. "the `:family_name` field"

## Create an AoH

Let's make a simple list of our favorite directors

```ruby
# Simple Hashes

director_1 = {
  name: "Ida Lupino",
  favorite_movie: "The Hitch-Hiker"
}

director_2 = {
  name: "Orson Welles",
  favorite_movie: "Citizen Kane"
}

director_3 = {
  name: "Andrej Tarkovsky",
  favorite_movie: "Solaris"
}

film_fest = [
  director_1,
  director_2,
  director_3,
] # => [{:name=>"Ida Lupino", :favorite_movie=>"The Hitch-Hiker"}, {:name=>"Orson Welles", :favorite_movie=>"Citizen Kane"}, {:name=>"Andrej Tarkovsky", :favorite_movie=>"Solaris"}]
```

If we don't need to use `director_1`, `director_2`, `director_3`, then we don't
need to assign them before nesting them in `film_fest`  We can write a nested
AoH using literal formatting:

```ruby
# AoH in one go
film_fest = [{:name=>"Ida Lupino", :favorite_movie=>"The Hitch-Hiker"}, {:name=>"Orson Welles", :favorite_movie=>"Citizen Kane"}, {:name=>"Andrej Tarkovsky", :favorite_movie=>"Solaris"}]

# Same as above, but using whitespace to make it easier for humans to read

film_fest = [
  {:name=>"Ida Lupino", :favorite_movie=>"The Hitch-Hiker"},
  {:name=>"Orson Welles", :favorite_movie=>"Citizen Kane"},
  {:name=>"Andrej Tarkovsky", :favorite_movie=>"Solaris"}
]

```

Since Ruby doesn't care about whitespace, we'd advise you to write an AoH like
the second example.

Take a moment to reflect, can you "see" the spreadsheet there in the Array
literal? There's more repetition than you'd see in a real spreadsheet, but the
idea of intersecting coordinates between an order (`0`, `1`, `2`, `3`) and a
key (`:name` or `:favorite_movie`) should feel a little bit like a spreadsheet.

It's good to keep those coordinates in mind as we start trying to retrieve
values in this next section!

## Read Scalar Data From a Nested Array

One of the defining features of AoHs is that we use coordinates to target
unique elements as if they were in a grid where one part of the coordinate is a
number and the other is a `Hash` key. To read an element from a nested `Array`,
simply provide the coordinates.

```ruby
directors = [
  {:name=>"Ida Lupino", :favorite_movie=>"The Hitch-Hiker"},
  {:name=>"Orson Welles", :favorite_movie=>"Citizen Kane"},
  {:name=>"Andrej Tarkovsky", :favorite_movie=>"Solaris"}
]

directors[0] #=> {:name=>"Ida Lupino", :favorite_movie=>"The Hitch-Hiker"}
directors[0][:name] #=> "Ida Lupino"
```

The first set of brackets refers to the "row" of "spreadsheet" of the AoH.  The
second set of brackets refer to the `key` used to get a _value_ out of the
`Hash`.

## Modify Scalar Data In an Array of Arrays

The same technique of using coordinates applies both to reading and
modification. If you can "target" an element you can read it or update it.

```ruby
directors = [
  {:name=>"Ida Lupino", :favorite_movie=>"The Hitch-Hiker"},
  {:name=>"Orson Welles", :favorite_movie=>"Citizen Kane"},
  {:name=>"Andrej Tarkovsky", :favorite_movie=>"Solaris"}
]

directors[0] #=> {:name=>"Ida Lupino", :favorite_movie=>"The Hitch-Hiker"}
directors[0][:name] #=> "Ida Lupino"
directors[0][:name] = "John Ford" #=> "John Ford" 
directors[0][:favorite_movie] = "The Grapes of Wrath" #=> "The Grapes of Wrath" 
directors[0] #=> {:name=>"John Ford", :favorite_movie=>"The Grapes of Wrath" }
directors #=> => [{:name=>"John Ford", :favorite_movie=>"The Grapes of Wrath"}, {:name=>"Orson Welles", :favorite_movie=>"Citizen Kane"}, {:name=>"Andrej Tarkovsky", :favorite_movie=>"Solaris"}]
```

You can also replace inner `Hash`es with new `Hash`es:

```ruby
directors = [
  {:name=>"Ida Lupino", :favorite_movie=>"The Hitch-Hiker"},
  {:name=>"Orson Welles", :favorite_movie=>"Citizen Kane"},
  {:name=>"Andrej Tarkovsky", :favorite_movie=>"Solaris"}
]

directors[1] = { name: "Cecil B. DeMille", favorite_movie: "Samson and Delilah" }
directors #=> => [{:name=>"Ida Lupino", :favorite_movie=>"The Hitch-Hiker"}, {:name=>"Cecil B. DeMille", :favorite_movie=>"Samson and Delilah"}, {:name=>"Andrej Tarkovsky", :favorite_movie=>"Solaris"}]
```

## Conclusion

Congratulations, you've learned to use your second nested data structure: the
`Array` of `Hash`es. You've seen that you can build them by building `Array`s
filled with variables that point to `Hash`es, or that you can use literal
notation to build them out.

You've seen that you can use coordinates to look up elements in the AoH as well
as update those elements. In the lab associated with this material, you'll have
a chance to make sure you've understood the basics.
