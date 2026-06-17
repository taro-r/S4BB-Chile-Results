comb block:

        combLT_noise = 10 * 1e-2
        
        if comb:
            # Add noise/systematics ONLY to comb maps
            mseed2 = seed2.standard_normal(size=(2,hp.nside2npix(NSIDE)))
            mnoise = combLT_noise * mseed2
            m = m + mnoise 

