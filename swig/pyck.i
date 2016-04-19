%module pyck

%typemap(in) (double *xyz) {
 int i;
 if (!PySequence_Check($input)) {
   PyErr_SetString(PyExc_ValueError,"Expected a sequence");
   return NULL;
 }

 $1 = (double *) malloc(3*sizeof(double));

 for (i = 0; i < 3; i++) {
   PyObject *s = PyList_GetItem($input,i);
   $1[i] = (double) PyFloat_AsDouble(s);
 }
}

//%typemap(freearg) (double *xyz) {
//  if ($1) free($1);
//}

%typemap(in) (double *dprop) {
 int i;
 if (!PySequence_Check($input)) {
   PyErr_SetString(PyExc_ValueError,"Expected a sequence");
   return NULL;
 }
 int len = PySequence_Length($input);
 $1 = (double *) malloc(len*sizeof(double));

 for (i = 0; i < len; i++) {
   PyObject *s = PyList_GetItem($input,i);
   $1[i] = (double) PyFloat_AsDouble(s);
 }
}

//%typemap(freearg) (double *dprop) {
//  if ($1) free($1);
//}

%typemap(in) (int *iprop) {
 int i;
 if (!PySequence_Check($input)) {
   PyErr_SetString(PyExc_ValueError,"Expected a sequence");
   return NULL;
 }
 int len = PySequence_Length($input);
 $1 = (int *) malloc(len*sizeof(int));

 for (i = 0; i < len; i++) {
   PyObject *s = PyList_GetItem($input,i);
   $1[i] = (int) PyInt_AsLong(s);
 }
}

//%typemap(freearg) (int *iprop) {
//  if ($1) free($1);
//}

%include pack.i

// Add an interface file for each new packer, see existing packers for reference
%include packers/cubicPacker.i
%include packers/fccPacker.i
%include packers/bccPacker.i
%include packers/hcpPacker.i

// Add an interface file for each new shape, see existing shapes for reference
%include shapes/cuboid.i
%include shapes/cylinder.i
%include shapes/sphere.i

%include model.i

// Add an interface file for each new writer, see existing writers for reference
%include writers/sparkWriter.i
