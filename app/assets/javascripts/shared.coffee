$ ->
  $("a[data-right-menu]").click (e) ->
    e.preventDefault()
    rightMenu = $(this).data("right-menu")
    if rightMenu == "ON"
      showRightBar()
    else
      hideRightBar()
showRightBar = () ->
  left = document.getElementById("left")
  if left
    left.style.width = "70%"
  right = document.getElementById("right")
  if right
    right.style.visibility = "visible"
    $("#showRightBtn").hide()
  true

hideRightBar = () ->
  left = document.getElementById("left")
  if left
    left.style.width = "100%"
  right = document.getElementById("right")
  if right
    right.style.visibility = "hidden"
    $("#showRightBtn").show()
