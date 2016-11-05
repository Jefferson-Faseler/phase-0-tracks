## ITEMS IN MY BOOKSHELF ##

bookshelf = { 
  top: {
    books: [
      "HTML & CSS by Jon Duckett",
      "Javascript & JQuery by Jon Duckett",
      "Journal 5"
    ],
    electronics: [
      "Children's Music CD's",
      "Leapfrog Tablet",
      "Singing Barbie doll (she can't see it this high up)"
    ],
    collectibles: [
      "Texas Rangers snapback cap",
      "Daughter's painting",
      "Boba Fett rare all-white concept armor action figure",
      "Dad's pocket knife"
    ],
  },
  upper_left: {
    books: [
      "Journal 1",
      "Journal 2",
      "Journal 3",
      "Star Wars: Tales of the Bounty Hunters",
      "Sacred Marriage",
      "Journal 4",
      "Azimov's Caliban",
      "Mary Oliver's Poetry Handbook",
      "All Creatures Great and Small"
    ],
    electronics: [
      "USB charger",
      "Headphones",
      "Phone cords",
      "Charging blocks",
      "Headlamp",
      "Flashlight"
    ],
    art_supplies: {
      assorted_brush_pens: {
        s_brush: "black",
        m_brush: {
          black: "black",
          blue: "blue",
          sage: "sage",
          violet: "violet",
          red: "red",
          marigold: "marigold",
          lemon_yellow: "lemon_yellow"
        },
        b_brush: "black",
        xb_brush: "black"
      },
      drawing_pad: "small",
      drawing_journal: "Small drawing journal"
    },
    collectibles: [
      "Beard comb inscribed 'Daddy's Whiskers'",
      "Boba Fett action figure",
      "Harry Potter Platform 9 3/4 ticket",
      "Magic Cards (if I hash this it would never end)",
      "Picture of Dad"
    ],
  },  
  upper_right: {
    hygiene: [
      "Deodorant",
      "Lotion",
      "Floss",
      "Comb",
      "Wife's makeup", #I shouldn't feel like I need to say that. It's 2016, man
      "Nail polish",
      "Some weird lotion I can't explain",
    ],
    cups: [
      "Texas Rangers coffee mug"
    ],
  },
  mid_left: {
    file_folders: {
      personal_records: [
        "Letters",
        "Identification",
        "sticker sheet",
      ],
      paid_bills: [
        "ConEd",
        "National Grid",
        "Optimum",
        "Student Loans",
        "Doctor",
        "Life Insurance",
        "Credit Cards"
      ],
      to_be_completed: [
        "Daughter's day-care papers",
        "MTA Incident Report",
        "Parking Ticket",
        "Bills"
      ],
    },
  },
  mid_right: {
    electronics: [
      "Power strip",
      "Heating pad",
      "VR Headset",
      "Kindle"
    ],
    books: [
      "Bible",
      "Journal 6"
    ],
  },
  bottom_left: {
    childrens_footwear: [
      "Cat shoes",
      "Minnie Mouse shoes",
      "Dorothy Red Slippers",
      "Swimming sandals",
      "flip flops",
      "White and purple flower shoes",
      "Black shoes",
      "Purple and white athletic shoes",
      "Aqua and orange Nikes",
      "Snow boots",
      "Frozen rain boots"
    ],
  },
  bottom_right: {
    childrens_books: [
      "Peanut Butter and Cupcake",
      "The Giving Tree",
      "Alexander's Terrible, No Good, Very Bad Day",
      "Darth Vader and Son",
      "Darth Vader and Princess",
      "First Words",
      "Sammy the Seal",
      "On The Night You Were Born",
      "Thank God for Puppies!",
      "The Cat Book",
      "Where the Wild Things Are",
      "Press Here",
      "Dada",
      "Star Wars Storybook Treasury",
      "Shel Silverstein Treasury"
    ],
  },
}


puts "Some of my favorite things in the world are on this book shelf."
puts "Some hobbies, some memories, some for fun, some have no emotional value at all."
puts "But I think this bookshelf is an expression of my life in some ways."
puts "For instance there are seven journals on this bookshelf."
puts bookshelf[:upper_left][:books][0], bookshelf[:upper_left][:books][1], 
bookshelf[:upper_left][:books][2], bookshelf[:upper_left][:books][5], 
bookshelf[:top][:books][2], bookshelf[:upper_left][:art_supplies][:drawing_journal], 
bookshelf[:mid_right][:books][1]

puts "I've also got a few Star Wars collectibles I'm very proud of"
puts bookshelf[:top][:collectibles][2], bookshelf[:upper_left][:books][3], bookshelf[:upper_left][:collectibles][1]
puts "Actually, come to think of it, I missed one!"
bookshelf[:upper_left][:collectibles].push("Star Wars Rebel insignia belt buckle")
puts bookshelf[:upper_left][:collectibles][5]

puts "My daughter is very major part of my life, I'm a stay-at-home dad so we spend a lot of time together."
puts "Today she decided it was time to take all the shoes out of the shelf"
annas_play_time = bookshelf[:bottom_left][:childrens_footwear]
bookshelf[:bottom_left].delete(:childrens_footwear)
p bookshelf[:bottom_left]
puts "#{annas_play_time} is now scattered across the house... gotta love her still"