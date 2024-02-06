#----------------------------------------------------------------
# Generated CMake target import file for configuration "RELEASE".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "ArrowDataset::arrow_dataset_shared" for configuration "RELEASE"
set_property(TARGET ArrowDataset::arrow_dataset_shared APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(ArrowDataset::arrow_dataset_shared PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libarrow_dataset.so.1600.0.0"
  IMPORTED_SONAME_RELEASE "libarrow_dataset.so.1600"
  )

list(APPEND _cmake_import_check_targets ArrowDataset::arrow_dataset_shared )
list(APPEND _cmake_import_check_files_for_ArrowDataset::arrow_dataset_shared "${_IMPORT_PREFIX}/lib/libarrow_dataset.so.1600.0.0" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
