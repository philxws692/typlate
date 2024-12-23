#import "settings/variables.typ": *
#import "settings/lib.typ": thesis
#import "@preview/acrostiche:0.5.0": acr, acrpl, acrfull, acrfullpl
#include "settings/acronyms.typ"

#set text(font: "Aptos")

#show: doc => thesis(
    title: topicOfPaper,
    doc
)

== Hello World
#lorem(80)

#figure(
    image("assets/dhbw_logo.jpg"),
    caption: [Ein tolles Bild]
)

#lorem(200)

#figure(
    table(
        align: horizon,
        columns: (30%, 30%),
        "Hello World",
        "Simple but cool code to start"
    ),
    caption: [Eine tolle Tabelle]
)

Um ein Akronym zu nutzen wird `typst #acr` genutzt. #acr("la")