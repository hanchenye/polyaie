//===----------------------------------------------------------------------===//
//
// Copyright 2021-2021 The PolyAIE Authors.
//
//===----------------------------------------------------------------------===//

#include "polyaie/Conversion/Passes.h"

using namespace mlir;
using namespace polyaie;

namespace {
#define GEN_PASS_REGISTRATION
#include "polyaie/Conversion/Passes.h.inc"
} // namespace

void polyaie::registerConversionPasses() { registerPasses(); }
