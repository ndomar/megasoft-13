# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/





adding = ->
  document.write "FAKES"
  div = document.getElementById("div")
  btn = document.createElement("BUTTON")
  t = document.createTextNode("CLICK ME")
  frame = document.createElement("iframe")
  btn.appendChild t
  div.appendChild btn
  div.appendChild frame