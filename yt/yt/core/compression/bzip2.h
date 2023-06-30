#pragma once

#include "stream.h"

namespace NYT::NCompression::NDetail {

////////////////////////////////////////////////////////////////////////////////

void Bzip2Compress(TSource* source, TBlob* output, int level);
void Bzip2Decompress(TSource* source, TBlob* output);

////////////////////////////////////////////////////////////////////////////////

} // namespace NYT::NCompression::NDetail
