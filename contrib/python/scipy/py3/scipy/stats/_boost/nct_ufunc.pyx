# distutils: language = c++
# cython: language_level=3

# This file was generated by stats/_boost/include/code_gen.py
# All modifications to this file will be overwritten.

from numpy cimport (
    import_array,
    import_ufunc,
    PyUFunc_FromFuncAndData,
    PyUFuncGenericFunction,
    PyUFunc_None,
    NPY_FLOAT,
    NPY_DOUBLE
)
from templated_pyufunc cimport PyUFunc_T
from func_defs cimport (
    boost_pdf2,
    boost_cdf2,
    boost_sf2,
    boost_ppf2,
    boost_isf2,
    boost_mean2,
    boost_variance2,
    boost_skewness2,
    boost_kurtosis_excess2,
)
cdef extern from "boost/math/distributions/non_central_t.hpp" namespace "boost::math" nogil:
    cdef cppclass non_central_t_distribution nogil:
        pass

# Workaround for Cython's lack of non-type template parameter
# support
cdef extern from * nogil:
    ctypedef int NINPUTS2 "2"
    ctypedef int NINPUTS3 "3"

_DUMMY = ""
import_array()
import_ufunc()

cdef PyUFuncGenericFunction loop_func0[2]
cdef void* func0[1*2]
cdef char types0[4*2]
loop_func0[0] = <PyUFuncGenericFunction>PyUFunc_T[float, NINPUTS3]
func0[0] = <void*>boost_pdf2[non_central_t_distribution, float, float, float]
types0[0+0*4] = NPY_FLOAT
types0[1+0*4] = NPY_FLOAT
types0[2+0*4] = NPY_FLOAT
types0[3+0*4] = NPY_FLOAT
loop_func0[1] = <PyUFuncGenericFunction>PyUFunc_T[double, NINPUTS3]
func0[1] = <void*>boost_pdf2[non_central_t_distribution, double, double, double]
types0[0+1*4] = NPY_DOUBLE
types0[1+1*4] = NPY_DOUBLE
types0[2+1*4] = NPY_DOUBLE
types0[3+1*4] = NPY_DOUBLE

_nct_pdf = PyUFunc_FromFuncAndData(
    loop_func0,
    func0,
    types0,
    2,  # number of supported input types
    3,  # number of input args
    1,  # number of output args
    PyUFunc_None,  # `identity` element, never mind this
    "_nct_pdf",  # function name
    ("_nct_pdf(x, df, nc) -> computes "
     "pdf of nct distribution"),
    0  # unused
)

cdef PyUFuncGenericFunction loop_func1[2]
cdef void* func1[1*2]
cdef char types1[4*2]
loop_func1[0] = <PyUFuncGenericFunction>PyUFunc_T[float, NINPUTS3]
func1[0] = <void*>boost_cdf2[non_central_t_distribution, float, float, float]
types1[0+0*4] = NPY_FLOAT
types1[1+0*4] = NPY_FLOAT
types1[2+0*4] = NPY_FLOAT
types1[3+0*4] = NPY_FLOAT
loop_func1[1] = <PyUFuncGenericFunction>PyUFunc_T[double, NINPUTS3]
func1[1] = <void*>boost_cdf2[non_central_t_distribution, double, double, double]
types1[0+1*4] = NPY_DOUBLE
types1[1+1*4] = NPY_DOUBLE
types1[2+1*4] = NPY_DOUBLE
types1[3+1*4] = NPY_DOUBLE

_nct_cdf = PyUFunc_FromFuncAndData(
    loop_func1,
    func1,
    types1,
    2,  # number of supported input types
    3,  # number of input args
    1,  # number of output args
    PyUFunc_None,  # `identity` element, never mind this
    "_nct_cdf",  # function name
    ("_nct_cdf(x, df, nc) -> computes "
     "cdf of nct distribution"),
    0  # unused
)

cdef PyUFuncGenericFunction loop_func2[2]
cdef void* func2[1*2]
cdef char types2[4*2]
loop_func2[0] = <PyUFuncGenericFunction>PyUFunc_T[float, NINPUTS3]
func2[0] = <void*>boost_sf2[non_central_t_distribution, float, float, float]
types2[0+0*4] = NPY_FLOAT
types2[1+0*4] = NPY_FLOAT
types2[2+0*4] = NPY_FLOAT
types2[3+0*4] = NPY_FLOAT
loop_func2[1] = <PyUFuncGenericFunction>PyUFunc_T[double, NINPUTS3]
func2[1] = <void*>boost_sf2[non_central_t_distribution, double, double, double]
types2[0+1*4] = NPY_DOUBLE
types2[1+1*4] = NPY_DOUBLE
types2[2+1*4] = NPY_DOUBLE
types2[3+1*4] = NPY_DOUBLE

_nct_sf = PyUFunc_FromFuncAndData(
    loop_func2,
    func2,
    types2,
    2,  # number of supported input types
    3,  # number of input args
    1,  # number of output args
    PyUFunc_None,  # `identity` element, never mind this
    "_nct_sf",  # function name
    ("_nct_sf(x, df, nc) -> computes "
     "sf of nct distribution"),
    0  # unused
)

cdef PyUFuncGenericFunction loop_func3[2]
cdef void* func3[1*2]
cdef char types3[4*2]
loop_func3[0] = <PyUFuncGenericFunction>PyUFunc_T[float, NINPUTS3]
func3[0] = <void*>boost_ppf2[non_central_t_distribution, float, float, float]
types3[0+0*4] = NPY_FLOAT
types3[1+0*4] = NPY_FLOAT
types3[2+0*4] = NPY_FLOAT
types3[3+0*4] = NPY_FLOAT
loop_func3[1] = <PyUFuncGenericFunction>PyUFunc_T[double, NINPUTS3]
func3[1] = <void*>boost_ppf2[non_central_t_distribution, double, double, double]
types3[0+1*4] = NPY_DOUBLE
types3[1+1*4] = NPY_DOUBLE
types3[2+1*4] = NPY_DOUBLE
types3[3+1*4] = NPY_DOUBLE

_nct_ppf = PyUFunc_FromFuncAndData(
    loop_func3,
    func3,
    types3,
    2,  # number of supported input types
    3,  # number of input args
    1,  # number of output args
    PyUFunc_None,  # `identity` element, never mind this
    "_nct_ppf",  # function name
    ("_nct_ppf(x, df, nc) -> computes "
     "ppf of nct distribution"),
    0  # unused
)

cdef PyUFuncGenericFunction loop_func4[2]
cdef void* func4[1*2]
cdef char types4[4*2]
loop_func4[0] = <PyUFuncGenericFunction>PyUFunc_T[float, NINPUTS3]
func4[0] = <void*>boost_isf2[non_central_t_distribution, float, float, float]
types4[0+0*4] = NPY_FLOAT
types4[1+0*4] = NPY_FLOAT
types4[2+0*4] = NPY_FLOAT
types4[3+0*4] = NPY_FLOAT
loop_func4[1] = <PyUFuncGenericFunction>PyUFunc_T[double, NINPUTS3]
func4[1] = <void*>boost_isf2[non_central_t_distribution, double, double, double]
types4[0+1*4] = NPY_DOUBLE
types4[1+1*4] = NPY_DOUBLE
types4[2+1*4] = NPY_DOUBLE
types4[3+1*4] = NPY_DOUBLE

_nct_isf = PyUFunc_FromFuncAndData(
    loop_func4,
    func4,
    types4,
    2,  # number of supported input types
    3,  # number of input args
    1,  # number of output args
    PyUFunc_None,  # `identity` element, never mind this
    "_nct_isf",  # function name
    ("_nct_isf(x, df, nc) -> computes "
     "isf of nct distribution"),
    0  # unused
)

cdef PyUFuncGenericFunction loop_func5[2]
cdef void* func5[1*2]
cdef char types5[3*2]
loop_func5[0] = <PyUFuncGenericFunction>PyUFunc_T[float, NINPUTS2]
func5[0] = <void*>boost_mean2[non_central_t_distribution, float, float, float]
types5[0+0*3] = NPY_FLOAT
types5[1+0*3] = NPY_FLOAT
types5[2+0*3] = NPY_FLOAT
loop_func5[1] = <PyUFuncGenericFunction>PyUFunc_T[double, NINPUTS2]
func5[1] = <void*>boost_mean2[non_central_t_distribution, double, double, double]
types5[0+1*3] = NPY_DOUBLE
types5[1+1*3] = NPY_DOUBLE
types5[2+1*3] = NPY_DOUBLE

_nct_mean = PyUFunc_FromFuncAndData(
    loop_func5,
    func5,
    types5,
    2,  # number of supported input types
    2,  # number of input args
    1,  # number of output args
    PyUFunc_None,  # `identity` element, never mind this
    "_nct_mean",  # function name
    ("_nct_mean(df, nc) -> computes "
     "mean of nct distribution"),
    0  # unused
)

cdef PyUFuncGenericFunction loop_func6[2]
cdef void* func6[1*2]
cdef char types6[3*2]
loop_func6[0] = <PyUFuncGenericFunction>PyUFunc_T[float, NINPUTS2]
func6[0] = <void*>boost_variance2[non_central_t_distribution, float, float, float]
types6[0+0*3] = NPY_FLOAT
types6[1+0*3] = NPY_FLOAT
types6[2+0*3] = NPY_FLOAT
loop_func6[1] = <PyUFuncGenericFunction>PyUFunc_T[double, NINPUTS2]
func6[1] = <void*>boost_variance2[non_central_t_distribution, double, double, double]
types6[0+1*3] = NPY_DOUBLE
types6[1+1*3] = NPY_DOUBLE
types6[2+1*3] = NPY_DOUBLE

_nct_variance = PyUFunc_FromFuncAndData(
    loop_func6,
    func6,
    types6,
    2,  # number of supported input types
    2,  # number of input args
    1,  # number of output args
    PyUFunc_None,  # `identity` element, never mind this
    "_nct_variance",  # function name
    ("_nct_variance(df, nc) -> computes "
     "variance of nct distribution"),
    0  # unused
)

cdef PyUFuncGenericFunction loop_func7[2]
cdef void* func7[1*2]
cdef char types7[3*2]
loop_func7[0] = <PyUFuncGenericFunction>PyUFunc_T[float, NINPUTS2]
func7[0] = <void*>boost_skewness2[non_central_t_distribution, float, float, float]
types7[0+0*3] = NPY_FLOAT
types7[1+0*3] = NPY_FLOAT
types7[2+0*3] = NPY_FLOAT
loop_func7[1] = <PyUFuncGenericFunction>PyUFunc_T[double, NINPUTS2]
func7[1] = <void*>boost_skewness2[non_central_t_distribution, double, double, double]
types7[0+1*3] = NPY_DOUBLE
types7[1+1*3] = NPY_DOUBLE
types7[2+1*3] = NPY_DOUBLE

_nct_skewness = PyUFunc_FromFuncAndData(
    loop_func7,
    func7,
    types7,
    2,  # number of supported input types
    2,  # number of input args
    1,  # number of output args
    PyUFunc_None,  # `identity` element, never mind this
    "_nct_skewness",  # function name
    ("_nct_skewness(df, nc) -> computes "
     "skewness of nct distribution"),
    0  # unused
)

cdef PyUFuncGenericFunction loop_func8[2]
cdef void* func8[1*2]
cdef char types8[3*2]
loop_func8[0] = <PyUFuncGenericFunction>PyUFunc_T[float, NINPUTS2]
func8[0] = <void*>boost_kurtosis_excess2[non_central_t_distribution, float, float, float]
types8[0+0*3] = NPY_FLOAT
types8[1+0*3] = NPY_FLOAT
types8[2+0*3] = NPY_FLOAT
loop_func8[1] = <PyUFuncGenericFunction>PyUFunc_T[double, NINPUTS2]
func8[1] = <void*>boost_kurtosis_excess2[non_central_t_distribution, double, double, double]
types8[0+1*3] = NPY_DOUBLE
types8[1+1*3] = NPY_DOUBLE
types8[2+1*3] = NPY_DOUBLE

_nct_kurtosis_excess = PyUFunc_FromFuncAndData(
    loop_func8,
    func8,
    types8,
    2,  # number of supported input types
    2,  # number of input args
    1,  # number of output args
    PyUFunc_None,  # `identity` element, never mind this
    "_nct_kurtosis_excess",  # function name
    ("_nct_kurtosis_excess(df, nc) -> computes "
     "kurtosis_excess of nct distribution"),
    0  # unused
)
