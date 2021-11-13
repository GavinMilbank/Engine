#!/bin/sh
export quantlib_version=1.24
wget https://github.com/lballabio/QuantLib/releases/download/QuantLib-v${quantlib_version}/QuantLib-${quantlib_version}.tar.gz \
    && tar xfz QuantLib-${quantlib_version}.tar.gz \
    && rm QuantLib-${quantlib_version}.tar.gz \
    && mv QuantLib-${quantlib_version} QuantLib
cd QuantLib && ./configure && make -j4
cd -
cd QuantExt && ./configure && make -j4 # && ./test/quantext-test-suite
cd =
cd OREData  && ./configure && make -j4 # && ./test/ored-test-suite
cd -
cd OREAnalytics && ./configure && make -j4 # && ./test/orea-test-suite
cd -
cd App && ./configure && make -j4
cd -
