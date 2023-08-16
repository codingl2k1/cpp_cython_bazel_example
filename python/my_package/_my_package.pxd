

from libc.stdint cimport int32_t

cdef extern from "cpp/include/my_header.h" nogil:
    int32_t c_add "add" (int32_t, int32_t)
