Injected the gaussian noise with mean 0 std 1e-2 noise in the noise sims into comb spectra
Expect slight increase in sigma(r) but no change in r (as bpcm models this noise)

comb block:

combLT_noise = 1e-2
        
        if comb:
            # Add Gaussian noise ONLY to comb maps
            mseed2 = seed2.standard_normal(size=(2,hp.nside2npix(NSIDE)))
            mnoise = combLT_noise * mseed2
            m = m + mnoise
