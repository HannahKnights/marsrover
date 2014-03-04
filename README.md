Mars Rover Challenge
========

### Application to direct Mars Rovers around a (remarkably) rectangular plateau 

Mars Rovers are robotic cameras sent to a plateau on Mars to collect data and send it back down to Earth. Fleets of Rovers are sent to specifc plateau's and expected to return their finishing position once all missions have been complete. They set-off one at a time, on a specified routes. Once this journey is complete they return their final co-ordinates.

The input sets the size of the plateau the Rovers are exploring, their starting position and the route they will take. Their may be any number of Rovers sent on a mission together.

More detailed explaination of the input:

~~~

5 5 
1 2 N
LMLMLMLMM
3 3 E
MMRMMRMRRM

~~~

* The first numbers (5 5) define the top right-hand co-ordinates of the plateau. This defines the plateau size.

* The following lines come in a pair. The first line (1 2 N) includes the starting position of the Rover as x and y co-ordinates, the letter following signifies the direction the Rover is facing (N or S or E or W).

* The string of letters ( LMLMLMLMM ) are the route for the Rover to take. 'M' directs the Rover to move forward one square in the direction it is facing, 'L' directs the Rover to turn 90° left, 'R' directs the Rove to turn 90° right.

* Any subsequent pairs of input following the same format as above, describing the starting positions and routes of Rovers to explore the terrain in sequence. 

The output they return, once all missions are complete is all the Rovers final positions, returned in the same sequence they were sent out.

More detailed explaination of the output:

~~~

1 3 N
5 1 E

~~~

* Each line ( 1 3 N ) references the final co-ordinates of the Rovers, in the same format the input was sent; x and y co-ordinates (xy) and the direction the rover is facing (N or S or E or W).



#### How to Use

...To be completed...

~~~
$ irb
~~~ 

#### Technology

* Ruby
* RSpec testing framework

