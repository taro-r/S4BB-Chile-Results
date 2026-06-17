import numpy as np

seednum = 16528
seed = np.random.default_rng(seednum)

def seedtestfunc(rlz):
    seededmap = seed.standard_normal(size=(2,3))
    return seededmap
    