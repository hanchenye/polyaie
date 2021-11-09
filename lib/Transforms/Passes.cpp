//===----------------------------------------------------------------------===//
//
// Copyright 2021-2021 The PolyAIE Authors.
//
//===----------------------------------------------------------------------===//

#include "polyaie/Passes.h"

using namespace mlir;
using namespace polyaie;

namespace {
#define GEN_PASS_REGISTRATION
#include "polyaie/Passes.h.inc"
} // namespace

void polyaie::registerPolyAIEPasses() { registerPasses(); }
