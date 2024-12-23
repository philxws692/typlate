#import "settings/variables.typ": *
#import "settings/lib.typ": thesis

#set text(font: "Aptos")

#show: doc => thesis(
    title: topicOfPaper,
    doc
)

== Hello World
#lorem(80)