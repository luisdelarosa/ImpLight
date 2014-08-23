ImpLight
========

Swift demo app to control an Electric Imp to change a LED

Requirements:
Xcode 6 Beta 5
Electric Imp
April breakout board
Breadboard
RGB LED
3 resistors
wires
Mini USB cable

You need to set up your project using this tutorial: https://learn.sparkfun.com/tutorials/electric-imp-breakout-hookup-guide#example-2-web-control-request

Then you need to get the agent ID from the agent URL and put set it in AFNetworkingClient in the agentId constant. In the tutorial, it is "UpyYpRLmBB7m".

Then after you compiled and run, you can choose a color (the initial color is blue) and then tap the Change the Light button. This sends an HTTP GET request to the agent, which should then change the LED.

Enjoy!
Luis "Louie" de la Rosa
@louielouie
luis.delarosa@capitalone.com
