## Inspiration

Drawing inspiration from “Angel Shots” or “Guardian Angel Shots”, we created Angel as a way for women to always have someone looking out for them. An “Angel Shot” is a coded order that women can say to bartenders or waiters at bars to signal they need assistance. The different varieties of angel shots could result in having an employee escort you to your car, calling an uber for you, or in extreme cases calling the police for you. We loved the idea that women could feel safe and protected without having to draw much attention to themselves, but, as a team of mainly high school seniors, we wanted to create something that could be applicable in places beyond just bars or nightclubs. 

In the past year, we’ve also noticed the emergence of instagram accounts where high school and college aged students could anonymously post their experiences of on-campus sexual harassment and assault, and we’ve seen recurrences of locations such as specific fraternity houses. Seeing how empowering these accounts were and their success in opening their communities’ eyes to the frequency of these events made us want to take it a step further.

Studies have shown that females ages 16-19 are 4 times more likely than the general population to be victims of rape, attempted rape, or sexual assault (RAINN Statistics). This statistic cemented our intent in creating something that could help girls avoid compromising situations. But beyond prevention, we recognize that many women have already experienced some form of sexual assault or harassment and we wanted to be able to tend to those women as well. To do so, we added a home page consisting of resources relating to personal safety and self care. We also included a community forum and messages tab to allow users to interact with each other and share their own experiences. Although a big portion of sexual assaults happen in public spaces, many occur in private houses where you can’t leave a review, so this forum allows for those women to still speak up about their experiences and offer advice to others about handling/navigating difficult situations.

## What it does

Angel allows users to post their personal experiences of sexual assault and/or harassment and pinpoint those experiences to a specific location on a map. In these reviews, users can also specify what amenities a location provides such as feminine products and “Angel Shots” as well as noting if the surrounding areas (such as parking lots) are well lit. With the choice to remain anonymous, we hope this feature of our app empowers women to speak up about their experiences without fear of negative consequences or potential judgement that may come out of it. These posts and “Angel Ratings” allow users, particularly women, to gauge the safeness of public spaces such as bars, parks, movie theaters, malls, etc. and be able to plan ahead for any of their future trips. In addition to Angel Ratings, our home tab also provides users with resources on personal safety and self-defense as well as both mental and physical self care. Users can also engage with others that may have similar experiences to them in the community forum page. In the community forum, users can discuss personal experiences or give advice to other women. Users also have the option to directly message other users in the messages tab.

## How I built it

Starting with the brainstorming process, our team created many ideas that we thought could be useful and important, and eventually landed on Angel. From there, we digitally created mock layouts using Adobe Illustrator and Canva. From those layouts we proceeded to create our first prototype on Invision and then started translating our prototype into an actual mobile application using Flutter. We used Firebase as our main backend, leveraging its Realtime Database to operate our community and messaging pages. Firebase Cloud Storage was used to store images and videos uploaded by our users. The last key technology in our project was the Google Maps Platform. We leveraged the Places Autocomplete and Search APIs to suggest places to the user based on their current location. This also allows the user to get information about various establishments straight from our app, all while displaying everything on a beautiful map.

## Challenges I ran into

With 3 out of 4 team members as first-time coders, I’m sure you can imagine just how difficult it was to simply get started. The entire process was a learning experience for us and oftentimes led to frustration. One team member spent hours just trying to learn how to properly align the text, and another took an entire day just to install the software. But eventually, even the members who hadn’t heard of Flutter before last week managed to become proficient enough in a completely new language to significantly contribute to the completion of the project.


## Accomplishments that I'm proud of

We are especially proud of our UI, since we spent a long time considering how to make the app intuitive to use and which layouts would give the user the best experience. We’re also proud of the level of detail that went into making each page, and how the app as a whole turned out.

## What I learned

On the technical side, we learned that a lot about object oriented programming, and its application in mobile development. Creating models to represent our different data structures and designing reusable widgets for our user interface are just some of the ways we saw object oriented programming make development more efficient.

Most of our team had to learn a lot during this weekend, either their first object-oriented programming language or their first programming language altogether. But aside from how to code, we learned through our research of the problem that sexual harassment and assault occurs more frequently than any of us could’ve guessed.

## What's next for Angel

In the future, we hope to gather more users from high school and college campuses to help incoming students prepare for campus life and be cautious of their surroundings. Most of our team will be entering college next year, and as we settle in with our peers in new cities we hope Angel can guide students to make safe and well-informed decisions. We also hope to use feedback from these new users and implement new features into Angel. One feature that we think would be a very beneficial addition is a trip tracker that will keep track of the user’s route when they are outside at night, and will automatically alert the authorities if the user is in trouble.
