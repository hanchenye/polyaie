//===----------------------------------------------------------------------===//
//
// Copyright 2021-2021 The PolyAIE Authors.
//
//===----------------------------------------------------------------------===//

#ifndef POLYAIE_MEMREFEXT_OPS_TD
#define POLYAIE_MEMREFEXT_OPS_TD

def MemCpyOp : MemRefExtOp<"memcpy", []> {
  let summary = "memory copy operation";
  let description = [{ }];

  let arguments = (ins);
  let results = (outs);
}

#endif // POLYAIE_MEMREFEXT_OPS_TD
