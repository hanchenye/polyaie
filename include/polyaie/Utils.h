//===----------------------------------------------------------------------===//
//
// Copyright 2021-2022 The PolyAIE Authors.
//
//===----------------------------------------------------------------------===//

#ifndef POLYAIE_UTILS_H
#define POLYAIE_UTILS_H

#include "aie/AIEDialect.h"
#include "circt/Dialect/Handshake/HandshakeOps.h"
#include "mlir/Dialect/Affine/IR/AffineOps.h"
#include "mlir/IR/BlockSupport.h"
#include "mlir/IR/BuiltinTypes.h"
#include "mlir/IR/Operation.h"
#include "polyaie/Dataflow/Dataflow.h"

namespace mlir {
namespace polyaie {

using AffineLoopBand = SmallVector<AffineForOp, 6>;
using AffineLoopBands = std::vector<AffineLoopBand>;

/// Collect all loop bands in the "block" and return them in "bands". If
/// "allowHavingChilds" is true, loop bands containing more than 1 other loop
/// bands are also collected. Otherwise, only loop bands that contains no child
/// loops are collected.
void getLoopBands(Block &block, AffineLoopBands &bands, bool reverse = false,
                  bool allowHavingChilds = false);

template <typename FuncType> FuncType getTopFunc(ModuleOp mod) {
  for (auto func : mod.template getOps<FuncType>())
    if (func->hasAttr("polyaie.top_func"))
      return func;
  emitError(mod.getLoc(), "failed to find top function");
  return FuncType();
}

unsigned getCol(Operation *op);
unsigned getRow(Operation *op);

bool adjacent(unsigned srcRow, unsigned srcCol, unsigned tgtRow,
              unsigned tgtCol);

xilinx::AIE::TileOp getShareableTile(xilinx::AIE::TileOp tileA,
                                     xilinx::AIE::TileOp tileB);

using UserIterator = Value::user_iterator;

/// A utility iterator that filters out operations that are not 'OpT'.
template <typename OpT>
class user_filter_iterator
    : public llvm::filter_iterator<UserIterator, bool (*)(Operation *)> {
  static bool filter(Operation *op) { return isa<OpT>(op); }

public:
  user_filter_iterator(UserIterator it, UserIterator end)
      : llvm::filter_iterator<UserIterator, bool (*)(Operation *)>(it, end,
                                                                   &filter) {}

  /// Allow implicit conversion to the underlying iterator.
  operator const UserIterator &() const { return this->wrapped(); }
};

/// This class provides iteration over the held operations of a block for a
/// specific operation type.
template <typename OpT>
class user_iterator : public llvm::mapped_iterator<user_filter_iterator<OpT>,
                                                   OpT (*)(Operation *)> {
  static OpT unwrap(Operation *op) { return cast<OpT>(op); }

public:
  /// Initializes the iterator to the specified filter iterator.
  user_iterator(user_filter_iterator<OpT> it)
      : llvm::mapped_iterator<user_filter_iterator<OpT>, OpT (*)(Operation *)>(
            it, &unwrap) {}

  /// Allow implicit conversion to the underlying block iterator.
  operator const UserIterator &() const { return this->wrapped(); }
};

/// Helpers for getting all users of the specified type.
template <typename OpT>
iterator_range<user_iterator<OpT>> getUsersOfType(Value val) {
  auto endIt = val.user_end();
  return {user_filter_iterator<OpT>(val.user_begin(), endIt),
          user_filter_iterator<OpT>(endIt, endIt)};
}

template <typename OpT> OpT getOnlyUserOfType(Value val) {
  auto users = getUsersOfType<OpT>(val);
  if (llvm::hasSingleElement(users))
    return *users.begin();
  return nullptr;
}

} // namespace polyaie
} // namespace mlir

#endif // POLYAIE_UTILS_H
