Injected Gaussian noise of amplitude 1e-2 (same as LT noise amplitude) into comb maps
comb block:

combLT_noise = 2 * 1e-2
        
        if comb:
            # Add Gaussian noise ONLY to comb maps
            mseed2 = seed2.standard_normal(size=(2,hp.nside2npix(NSIDE)))
            mnoise = combLT_noise * mseed2
            m = m + mnoise 




