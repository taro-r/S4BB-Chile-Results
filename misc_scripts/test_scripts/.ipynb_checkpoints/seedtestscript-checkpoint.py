# Scripts to get used to seeding randomly generated maps

import numpy as np
import seedtestscript2 as sts2

for rlz in range(0,10):
    testmap = sts2.seedtestfunc(rlz)
    print(testmap)

