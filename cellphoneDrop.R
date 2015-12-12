# figure out the cell phone drop test: http://fivethirtyeight.com/features/whats-the-best-way-to-drop-a-smartphone/
# intuition: you have to start at the bottom. Safest route is obviously to try every floor.
# but, can we go faster? First thought was to skip every other floor: start on 1 (assuming 
# phone could break there), then go to 3. If phone breaks there, can still test other phone
# on 2 to decide if the answer is 1 or 2. But could we skip up to 4, then try 2 and 3 
#if the first one breaks?  additional question: best starting point? this is the speed test

#clean the palate
rm(list=ls())
#set up some constants
nStory <- 100 #height of tower
breaksOn <- 1:nStory #we'll try every possible answer to see when different jumps are better
startAt <- 1:nStory #try every position, but assuming that high values will be bad
jumper <- 1:nStory #trying them all, but again assuming that too much will be bad
nphones <- 2 #given

#critical answer is the drop count
dropTracker <- array(0,c(length(startAt),length(breaksOn),length(jumper)))

#loop through our options
for (startPoint in 1:length(startAt)) {
  for (jump in 1:length(jumper)) {
    for (broken in 1:length(breaksOn)) {
      onFloor<- startAt[startPoint]
      jumps <- jumper[jump] #need to reset per test
      nphones <- 2 #same
      breakPoint <- breaksOn[broken]
      #do the dropping
      dropCount <- 0
      x <- 1
      while (nphones>0) {
        change <- FALSE
        #do the drop. if from too high, lose phone. either way, counts as drop
        if (onFloor >= breakPoint) {
          nphones <- nphones-1
          change <- TRUE #mark if we broke a phone
        }
        dropCount <- dropCount+1
        #now change floors
        if (change) { #if we break a phone, need to go back to floor above the last successful drop
          onFloor <- onFloor - jumps + 1
        } else { #otherwise, proceed as normal
          onFloor <- onFloor + jumps
        }
        if (onFloor > nStory) { #so we don't go over the height of the building
          onFloor <- nStory
        }
        if (onFloor <1) { #so it doesn't try to go back too far
          onFloor <- 1
        }
        if (nphones == 1) { #if we're on our last phone, we'll just be going up one at a time
          jumps <- 1
        }
        if (nphones == 0) {
          dropTracker[startPoint,broken,jump] <- dropCount #put the final result away
        }
      }
    }
  }
}
