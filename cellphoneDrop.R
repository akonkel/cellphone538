# figure out the cell phone drop test: http://fivethirtyeight.com/features/whats-the-best-way-to-drop-a-smartphone/
# intuition: you have to start at the bottom. Safest route is obviously to try every floor.
# but, can we go faster? First thought was to skip every other floor: start on 1 (assuming 
# phone could break there), then go to 3. If phone breaks there, can still test other phone
# on 2 to decide if the answer is 1 or 2. But could we skip up to 4, then try 2 and 3 
#if the first one breaks?  additional question: best starting point? this is the speed test

#set up some constants
nStory <- 100 #height of tower
breaksOn <- 50 #we'll try every possible answer to see when different jumps are better
startAt <- 1 #try every position, but assuming that high values will be bad
jumps <- 2 #trying them all, but again assuming that too much will be bad
nphones <- 2 #given

#make a function to handle the drop event
dropPhone <- function(floor, breakPoint) {
  if (floor >= breakPoint) {
    nphones <- nphones-1
  }
  dropCount <- dropCount+1
}

#critical answer is the drop count
dropCount <- array(0,c(length(startAt),length(breaksOn),length(jumps)))

#loop through our options
while (nphones>0) {
  for (iteration in jumps) {
    for (onFloor in startAt) {
      for (breaks in breaksOn) {
        breakPoint <- breaks
        floor<- onFloor
        result <- dropPhone(floor,breakPoint)
      }
    }
  }
}