# figure out the cell phone drop test: http://fivethirtyeight.com/features/whats-the-best-way-to-drop-a-smartphone/
# intuition: you have to start at the bottom. Safest route is obviously to try every floor.
# but, can we go faster? First thought was to skip every other floor: start on 1 (assuming 
# phone could break there), then go to 3. If phone breaks there, can still test other phone
# on 2 to decide if the answer is 1 or 2. But could we skip up to 4, then try 2 and 3 if the first one breaks?
# this is the speed test

#set up some constants
nStory=100 #height of tower
breaksOn=1:nStory #we'll try every possible answer to see when different jumps are better