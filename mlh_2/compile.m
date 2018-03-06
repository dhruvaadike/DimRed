mex loss_adj_inf_mex.cpp CXXFLAGS="\$CXXFLAGS -fopenmp" LDFLAGS="\$LDFLAGS -fopenmp";
mex utils/hammDist_mex.cpp -outdir utils;
mex utils/accumarray_reverse.cpp -outdir utils;
