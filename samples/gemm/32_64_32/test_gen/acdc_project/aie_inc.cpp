void mlir_aie_configure_cores(aie_libxaie_ctx_t *ctx) {
  XAieTile_ShimColumnReset(&(ctx->TileInst[26][0]), XAIE_RESETENABLE);
  // Reset configuration
  // Reset configuration
  // ShimDMA
  for (int i = 0x1D000; i <= 0x1D13C; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[26][0]))->TileAddr + i, 0);
  for (int i = 0x1D140; i <= 0x1D140; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[26][0]))->TileAddr + i, 0);
  for (int i = 0x1D148; i <= 0x1D148; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[26][0]))->TileAddr + i, 0);
  for (int i = 0x1D150; i <= 0x1D150; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[26][0]))->TileAddr + i, 0);
  for (int i = 0x1D158; i <= 0x1D158; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[26][0]))->TileAddr + i, 0);
  // Stream Switch master config
  for (int i = 0x3F000; i <= 0x3F058; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[26][0]))->TileAddr + i, 0);
  // Stream Switch slave config
  for (int i = 0x3F100; i <= 0x3F15C; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[26][0]))->TileAddr + i, 0);
  // Stream Switch slave slot config
  for (int i = 0x3F200; i <= 0x3F37C; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[26][0]))->TileAddr + i, 0);
  XAieTile_ShimColumnReset(&(ctx->TileInst[26][0]), XAIE_RESETDISABLE);
  XAieTile_ShimColumnReset(&(ctx->TileInst[0][0]), XAIE_RESETENABLE);
  // Reset configuration
  XAieTile_ShimColumnReset(&(ctx->TileInst[0][0]), XAIE_RESETDISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[26][2]), XAIE_DISABLE, XAIE_ENABLE);
  // Reset configuration
  // Program Memory
  for (int i = 0x20000; i <= 0x23FFF; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[26][2]))->TileAddr + i, 0);
  // TileDMA
  for (int i = 0x1D000; i <= 0x1D1F8; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[26][2]))->TileAddr + i, 0);
  for (int i = 0x1DE00; i <= 0x1DE00; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[26][2]))->TileAddr + i, 0);
  for (int i = 0x1DE08; i <= 0x1DE08; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[26][2]))->TileAddr + i, 0);
  for (int i = 0x1DE10; i <= 0x1DE10; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[26][2]))->TileAddr + i, 0);
  for (int i = 0x1DE18; i <= 0x1DE18; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[26][2]))->TileAddr + i, 0);
  // Stream Switch master config
  for (int i = 0x3F000; i <= 0x3F060; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[26][2]))->TileAddr + i, 0);
  // Stream Switch slave config
  for (int i = 0x3F100; i <= 0x3F168; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[26][2]))->TileAddr + i, 0);
  // Stream Switch slave slot config
  for (int i = 0x3F200; i <= 0x3F3AC; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[26][2]))->TileAddr + i, 0);
  for (int l = 0; l < 16; l++)
    XAieTile_LockRelease(&(ctx->TileInst[26][2]), l, 0x0, 0);
  {
    int ret = XAieGbl_LoadElf(&(ctx->TileInst[26][2]), (u8 *)"core_26_2.elf",
                              XAIE_ENABLE);
    if (ret == XAIELIB_FAILURE)
      printf("Failed to load elf for Core[%d,%d], ret is %d", 26, 2, ret);
    assert(ret != XAIELIB_FAILURE);
  }
  XAieTile_CoreControl(&(ctx->TileInst[26][3]), XAIE_DISABLE, XAIE_ENABLE);
  // Reset configuration
  // Program Memory
  for (int i = 0x20000; i <= 0x23FFF; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[26][3]))->TileAddr + i, 0);
  // TileDMA
  for (int i = 0x1D000; i <= 0x1D1F8; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[26][3]))->TileAddr + i, 0);
  for (int i = 0x1DE00; i <= 0x1DE00; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[26][3]))->TileAddr + i, 0);
  for (int i = 0x1DE08; i <= 0x1DE08; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[26][3]))->TileAddr + i, 0);
  for (int i = 0x1DE10; i <= 0x1DE10; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[26][3]))->TileAddr + i, 0);
  for (int i = 0x1DE18; i <= 0x1DE18; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[26][3]))->TileAddr + i, 0);
  // Stream Switch master config
  for (int i = 0x3F000; i <= 0x3F060; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[26][3]))->TileAddr + i, 0);
  // Stream Switch slave config
  for (int i = 0x3F100; i <= 0x3F168; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[26][3]))->TileAddr + i, 0);
  // Stream Switch slave slot config
  for (int i = 0x3F200; i <= 0x3F3AC; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[26][3]))->TileAddr + i, 0);
  for (int l = 0; l < 16; l++)
    XAieTile_LockRelease(&(ctx->TileInst[26][3]), l, 0x0, 0);
  {
    int ret = XAieGbl_LoadElf(&(ctx->TileInst[26][3]), (u8 *)"core_26_3.elf",
                              XAIE_ENABLE);
    if (ret == XAIELIB_FAILURE)
      printf("Failed to load elf for Core[%d,%d], ret is %d", 26, 3, ret);
    assert(ret != XAIELIB_FAILURE);
  }
  XAieTile_CoreControl(&(ctx->TileInst[26][1]), XAIE_DISABLE, XAIE_ENABLE);
  // Reset configuration
  // Program Memory
  for (int i = 0x20000; i <= 0x23FFF; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[26][1]))->TileAddr + i, 0);
  // TileDMA
  for (int i = 0x1D000; i <= 0x1D1F8; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[26][1]))->TileAddr + i, 0);
  for (int i = 0x1DE00; i <= 0x1DE00; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[26][1]))->TileAddr + i, 0);
  for (int i = 0x1DE08; i <= 0x1DE08; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[26][1]))->TileAddr + i, 0);
  for (int i = 0x1DE10; i <= 0x1DE10; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[26][1]))->TileAddr + i, 0);
  for (int i = 0x1DE18; i <= 0x1DE18; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[26][1]))->TileAddr + i, 0);
  // Stream Switch master config
  for (int i = 0x3F000; i <= 0x3F060; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[26][1]))->TileAddr + i, 0);
  // Stream Switch slave config
  for (int i = 0x3F100; i <= 0x3F168; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[26][1]))->TileAddr + i, 0);
  // Stream Switch slave slot config
  for (int i = 0x3F200; i <= 0x3F3AC; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[26][1]))->TileAddr + i, 0);
  for (int l = 0; l < 16; l++)
    XAieTile_LockRelease(&(ctx->TileInst[26][1]), l, 0x0, 0);
  XAieTile_CoreControl(&(ctx->TileInst[0][1]), XAIE_DISABLE, XAIE_ENABLE);
  // Reset configuration
  // Program Memory
  for (int i = 0x20000; i <= 0x23FFF; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[0][1]))->TileAddr + i, 0);
  // TileDMA
  for (int i = 0x1D000; i <= 0x1D1F8; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[0][1]))->TileAddr + i, 0);
  for (int i = 0x1DE00; i <= 0x1DE00; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[0][1]))->TileAddr + i, 0);
  for (int i = 0x1DE08; i <= 0x1DE08; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[0][1]))->TileAddr + i, 0);
  for (int i = 0x1DE10; i <= 0x1DE10; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[0][1]))->TileAddr + i, 0);
  for (int i = 0x1DE18; i <= 0x1DE18; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[0][1]))->TileAddr + i, 0);
  // Stream Switch master config
  for (int i = 0x3F000; i <= 0x3F060; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[0][1]))->TileAddr + i, 0);
  // Stream Switch slave config
  for (int i = 0x3F100; i <= 0x3F168; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[0][1]))->TileAddr + i, 0);
  // Stream Switch slave slot config
  for (int i = 0x3F200; i <= 0x3F3AC; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[0][1]))->TileAddr + i, 0);
  for (int l = 0; l < 16; l++)
    XAieTile_LockRelease(&(ctx->TileInst[0][1]), l, 0x0, 0);
  XAieTile_CoreControl(&(ctx->TileInst[0][2]), XAIE_DISABLE, XAIE_ENABLE);
  // Reset configuration
  // Program Memory
  for (int i = 0x20000; i <= 0x23FFF; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[0][2]))->TileAddr + i, 0);
  // TileDMA
  for (int i = 0x1D000; i <= 0x1D1F8; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[0][2]))->TileAddr + i, 0);
  for (int i = 0x1DE00; i <= 0x1DE00; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[0][2]))->TileAddr + i, 0);
  for (int i = 0x1DE08; i <= 0x1DE08; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[0][2]))->TileAddr + i, 0);
  for (int i = 0x1DE10; i <= 0x1DE10; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[0][2]))->TileAddr + i, 0);
  for (int i = 0x1DE18; i <= 0x1DE18; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[0][2]))->TileAddr + i, 0);
  // Stream Switch master config
  for (int i = 0x3F000; i <= 0x3F060; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[0][2]))->TileAddr + i, 0);
  // Stream Switch slave config
  for (int i = 0x3F100; i <= 0x3F168; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[0][2]))->TileAddr + i, 0);
  // Stream Switch slave slot config
  for (int i = 0x3F200; i <= 0x3F3AC; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[0][2]))->TileAddr + i, 0);
  for (int l = 0; l < 16; l++)
    XAieTile_LockRelease(&(ctx->TileInst[0][2]), l, 0x0, 0);
  XAieTile_CoreControl(&(ctx->TileInst[0][3]), XAIE_DISABLE, XAIE_ENABLE);
  // Reset configuration
  // Program Memory
  for (int i = 0x20000; i <= 0x23FFF; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[0][3]))->TileAddr + i, 0);
  // TileDMA
  for (int i = 0x1D000; i <= 0x1D1F8; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[0][3]))->TileAddr + i, 0);
  for (int i = 0x1DE00; i <= 0x1DE00; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[0][3]))->TileAddr + i, 0);
  for (int i = 0x1DE08; i <= 0x1DE08; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[0][3]))->TileAddr + i, 0);
  for (int i = 0x1DE10; i <= 0x1DE10; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[0][3]))->TileAddr + i, 0);
  for (int i = 0x1DE18; i <= 0x1DE18; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[0][3]))->TileAddr + i, 0);
  // Stream Switch master config
  for (int i = 0x3F000; i <= 0x3F060; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[0][3]))->TileAddr + i, 0);
  // Stream Switch slave config
  for (int i = 0x3F100; i <= 0x3F168; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[0][3]))->TileAddr + i, 0);
  // Stream Switch slave slot config
  for (int i = 0x3F200; i <= 0x3F3AC; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[0][3]))->TileAddr + i, 0);
  for (int l = 0; l < 16; l++)
    XAieTile_LockRelease(&(ctx->TileInst[0][3]), l, 0x0, 0);
  XAieTile_ShimColumnReset(&(ctx->TileInst[1][0]), XAIE_RESETENABLE);
  // Reset configuration
  // Stream Switch master config
  for (int i = 0x3F000; i <= 0x3F058; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[1][0]))->TileAddr + i, 0);
  // Stream Switch slave config
  for (int i = 0x3F100; i <= 0x3F15C; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[1][0]))->TileAddr + i, 0);
  // Stream Switch slave slot config
  for (int i = 0x3F200; i <= 0x3F37C; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[1][0]))->TileAddr + i, 0);
  XAieTile_ShimColumnReset(&(ctx->TileInst[1][0]), XAIE_RESETDISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[1][1]), XAIE_DISABLE, XAIE_ENABLE);
  // Reset configuration
  // Program Memory
  for (int i = 0x20000; i <= 0x23FFF; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[1][1]))->TileAddr + i, 0);
  // TileDMA
  for (int i = 0x1D000; i <= 0x1D1F8; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[1][1]))->TileAddr + i, 0);
  for (int i = 0x1DE00; i <= 0x1DE00; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[1][1]))->TileAddr + i, 0);
  for (int i = 0x1DE08; i <= 0x1DE08; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[1][1]))->TileAddr + i, 0);
  for (int i = 0x1DE10; i <= 0x1DE10; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[1][1]))->TileAddr + i, 0);
  for (int i = 0x1DE18; i <= 0x1DE18; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[1][1]))->TileAddr + i, 0);
  // Stream Switch master config
  for (int i = 0x3F000; i <= 0x3F060; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[1][1]))->TileAddr + i, 0);
  // Stream Switch slave config
  for (int i = 0x3F100; i <= 0x3F168; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[1][1]))->TileAddr + i, 0);
  // Stream Switch slave slot config
  for (int i = 0x3F200; i <= 0x3F3AC; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[1][1]))->TileAddr + i, 0);
  for (int l = 0; l < 16; l++)
    XAieTile_LockRelease(&(ctx->TileInst[1][1]), l, 0x0, 0);
  XAieTile_CoreControl(&(ctx->TileInst[1][2]), XAIE_DISABLE, XAIE_ENABLE);
  // Reset configuration
  // Program Memory
  for (int i = 0x20000; i <= 0x23FFF; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[1][2]))->TileAddr + i, 0);
  // TileDMA
  for (int i = 0x1D000; i <= 0x1D1F8; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[1][2]))->TileAddr + i, 0);
  for (int i = 0x1DE00; i <= 0x1DE00; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[1][2]))->TileAddr + i, 0);
  for (int i = 0x1DE08; i <= 0x1DE08; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[1][2]))->TileAddr + i, 0);
  for (int i = 0x1DE10; i <= 0x1DE10; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[1][2]))->TileAddr + i, 0);
  for (int i = 0x1DE18; i <= 0x1DE18; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[1][2]))->TileAddr + i, 0);
  // Stream Switch master config
  for (int i = 0x3F000; i <= 0x3F060; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[1][2]))->TileAddr + i, 0);
  // Stream Switch slave config
  for (int i = 0x3F100; i <= 0x3F168; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[1][2]))->TileAddr + i, 0);
  // Stream Switch slave slot config
  for (int i = 0x3F200; i <= 0x3F3AC; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[1][2]))->TileAddr + i, 0);
  for (int l = 0; l < 16; l++)
    XAieTile_LockRelease(&(ctx->TileInst[1][2]), l, 0x0, 0);
  XAieTile_CoreControl(&(ctx->TileInst[1][3]), XAIE_DISABLE, XAIE_ENABLE);
  // Reset configuration
  // Program Memory
  for (int i = 0x20000; i <= 0x23FFF; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[1][3]))->TileAddr + i, 0);
  // TileDMA
  for (int i = 0x1D000; i <= 0x1D1F8; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[1][3]))->TileAddr + i, 0);
  for (int i = 0x1DE00; i <= 0x1DE00; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[1][3]))->TileAddr + i, 0);
  for (int i = 0x1DE08; i <= 0x1DE08; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[1][3]))->TileAddr + i, 0);
  for (int i = 0x1DE10; i <= 0x1DE10; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[1][3]))->TileAddr + i, 0);
  for (int i = 0x1DE18; i <= 0x1DE18; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[1][3]))->TileAddr + i, 0);
  // Stream Switch master config
  for (int i = 0x3F000; i <= 0x3F060; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[1][3]))->TileAddr + i, 0);
  // Stream Switch slave config
  for (int i = 0x3F100; i <= 0x3F168; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[1][3]))->TileAddr + i, 0);
  // Stream Switch slave slot config
  for (int i = 0x3F200; i <= 0x3F3AC; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[1][3]))->TileAddr + i, 0);
  for (int l = 0; l < 16; l++)
    XAieTile_LockRelease(&(ctx->TileInst[1][3]), l, 0x0, 0);
  XAieTile_ShimColumnReset(&(ctx->TileInst[2][0]), XAIE_RESETENABLE);
  // Reset configuration
  // Reset configuration
  // ShimDMA
  for (int i = 0x1D000; i <= 0x1D13C; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[2][0]))->TileAddr + i, 0);
  for (int i = 0x1D140; i <= 0x1D140; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[2][0]))->TileAddr + i, 0);
  for (int i = 0x1D148; i <= 0x1D148; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[2][0]))->TileAddr + i, 0);
  for (int i = 0x1D150; i <= 0x1D150; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[2][0]))->TileAddr + i, 0);
  for (int i = 0x1D158; i <= 0x1D158; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[2][0]))->TileAddr + i, 0);
  // Stream Switch master config
  for (int i = 0x3F000; i <= 0x3F058; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[2][0]))->TileAddr + i, 0);
  // Stream Switch slave config
  for (int i = 0x3F100; i <= 0x3F15C; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[2][0]))->TileAddr + i, 0);
  // Stream Switch slave slot config
  for (int i = 0x3F200; i <= 0x3F37C; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[2][0]))->TileAddr + i, 0);
  XAieTile_ShimColumnReset(&(ctx->TileInst[2][0]), XAIE_RESETDISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[2][1]), XAIE_DISABLE, XAIE_ENABLE);
  // Reset configuration
  // Program Memory
  for (int i = 0x20000; i <= 0x23FFF; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[2][1]))->TileAddr + i, 0);
  // TileDMA
  for (int i = 0x1D000; i <= 0x1D1F8; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[2][1]))->TileAddr + i, 0);
  for (int i = 0x1DE00; i <= 0x1DE00; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[2][1]))->TileAddr + i, 0);
  for (int i = 0x1DE08; i <= 0x1DE08; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[2][1]))->TileAddr + i, 0);
  for (int i = 0x1DE10; i <= 0x1DE10; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[2][1]))->TileAddr + i, 0);
  for (int i = 0x1DE18; i <= 0x1DE18; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[2][1]))->TileAddr + i, 0);
  // Stream Switch master config
  for (int i = 0x3F000; i <= 0x3F060; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[2][1]))->TileAddr + i, 0);
  // Stream Switch slave config
  for (int i = 0x3F100; i <= 0x3F168; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[2][1]))->TileAddr + i, 0);
  // Stream Switch slave slot config
  for (int i = 0x3F200; i <= 0x3F3AC; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[2][1]))->TileAddr + i, 0);
  for (int l = 0; l < 16; l++)
    XAieTile_LockRelease(&(ctx->TileInst[2][1]), l, 0x0, 0);
  XAieTile_CoreControl(&(ctx->TileInst[2][2]), XAIE_DISABLE, XAIE_ENABLE);
  // Reset configuration
  // Program Memory
  for (int i = 0x20000; i <= 0x23FFF; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[2][2]))->TileAddr + i, 0);
  // TileDMA
  for (int i = 0x1D000; i <= 0x1D1F8; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[2][2]))->TileAddr + i, 0);
  for (int i = 0x1DE00; i <= 0x1DE00; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[2][2]))->TileAddr + i, 0);
  for (int i = 0x1DE08; i <= 0x1DE08; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[2][2]))->TileAddr + i, 0);
  for (int i = 0x1DE10; i <= 0x1DE10; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[2][2]))->TileAddr + i, 0);
  for (int i = 0x1DE18; i <= 0x1DE18; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[2][2]))->TileAddr + i, 0);
  // Stream Switch master config
  for (int i = 0x3F000; i <= 0x3F060; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[2][2]))->TileAddr + i, 0);
  // Stream Switch slave config
  for (int i = 0x3F100; i <= 0x3F168; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[2][2]))->TileAddr + i, 0);
  // Stream Switch slave slot config
  for (int i = 0x3F200; i <= 0x3F3AC; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[2][2]))->TileAddr + i, 0);
  for (int l = 0; l < 16; l++)
    XAieTile_LockRelease(&(ctx->TileInst[2][2]), l, 0x0, 0);
  XAieTile_CoreControl(&(ctx->TileInst[2][3]), XAIE_DISABLE, XAIE_ENABLE);
  // Reset configuration
  // Program Memory
  for (int i = 0x20000; i <= 0x23FFF; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[2][3]))->TileAddr + i, 0);
  // TileDMA
  for (int i = 0x1D000; i <= 0x1D1F8; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[2][3]))->TileAddr + i, 0);
  for (int i = 0x1DE00; i <= 0x1DE00; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[2][3]))->TileAddr + i, 0);
  for (int i = 0x1DE08; i <= 0x1DE08; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[2][3]))->TileAddr + i, 0);
  for (int i = 0x1DE10; i <= 0x1DE10; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[2][3]))->TileAddr + i, 0);
  for (int i = 0x1DE18; i <= 0x1DE18; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[2][3]))->TileAddr + i, 0);
  // Stream Switch master config
  for (int i = 0x3F000; i <= 0x3F060; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[2][3]))->TileAddr + i, 0);
  // Stream Switch slave config
  for (int i = 0x3F100; i <= 0x3F168; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[2][3]))->TileAddr + i, 0);
  // Stream Switch slave slot config
  for (int i = 0x3F200; i <= 0x3F3AC; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[2][3]))->TileAddr + i, 0);
  for (int l = 0; l < 16; l++)
    XAieTile_LockRelease(&(ctx->TileInst[2][3]), l, 0x0, 0);
  XAieTile_ShimColumnReset(&(ctx->TileInst[3][0]), XAIE_RESETENABLE);
  // Reset configuration
  // Reset configuration
  // ShimDMA
  for (int i = 0x1D000; i <= 0x1D13C; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[3][0]))->TileAddr + i, 0);
  for (int i = 0x1D140; i <= 0x1D140; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[3][0]))->TileAddr + i, 0);
  for (int i = 0x1D148; i <= 0x1D148; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[3][0]))->TileAddr + i, 0);
  for (int i = 0x1D150; i <= 0x1D150; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[3][0]))->TileAddr + i, 0);
  for (int i = 0x1D158; i <= 0x1D158; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[3][0]))->TileAddr + i, 0);
  // Stream Switch master config
  for (int i = 0x3F000; i <= 0x3F058; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[3][0]))->TileAddr + i, 0);
  // Stream Switch slave config
  for (int i = 0x3F100; i <= 0x3F15C; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[3][0]))->TileAddr + i, 0);
  // Stream Switch slave slot config
  for (int i = 0x3F200; i <= 0x3F37C; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[3][0]))->TileAddr + i, 0);
  XAieTile_ShimColumnReset(&(ctx->TileInst[3][0]), XAIE_RESETDISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[3][1]), XAIE_DISABLE, XAIE_ENABLE);
  // Reset configuration
  // Program Memory
  for (int i = 0x20000; i <= 0x23FFF; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[3][1]))->TileAddr + i, 0);
  // TileDMA
  for (int i = 0x1D000; i <= 0x1D1F8; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[3][1]))->TileAddr + i, 0);
  for (int i = 0x1DE00; i <= 0x1DE00; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[3][1]))->TileAddr + i, 0);
  for (int i = 0x1DE08; i <= 0x1DE08; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[3][1]))->TileAddr + i, 0);
  for (int i = 0x1DE10; i <= 0x1DE10; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[3][1]))->TileAddr + i, 0);
  for (int i = 0x1DE18; i <= 0x1DE18; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[3][1]))->TileAddr + i, 0);
  // Stream Switch master config
  for (int i = 0x3F000; i <= 0x3F060; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[3][1]))->TileAddr + i, 0);
  // Stream Switch slave config
  for (int i = 0x3F100; i <= 0x3F168; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[3][1]))->TileAddr + i, 0);
  // Stream Switch slave slot config
  for (int i = 0x3F200; i <= 0x3F3AC; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[3][1]))->TileAddr + i, 0);
  for (int l = 0; l < 16; l++)
    XAieTile_LockRelease(&(ctx->TileInst[3][1]), l, 0x0, 0);
  XAieTile_CoreControl(&(ctx->TileInst[3][2]), XAIE_DISABLE, XAIE_ENABLE);
  // Reset configuration
  // Program Memory
  for (int i = 0x20000; i <= 0x23FFF; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[3][2]))->TileAddr + i, 0);
  // TileDMA
  for (int i = 0x1D000; i <= 0x1D1F8; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[3][2]))->TileAddr + i, 0);
  for (int i = 0x1DE00; i <= 0x1DE00; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[3][2]))->TileAddr + i, 0);
  for (int i = 0x1DE08; i <= 0x1DE08; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[3][2]))->TileAddr + i, 0);
  for (int i = 0x1DE10; i <= 0x1DE10; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[3][2]))->TileAddr + i, 0);
  for (int i = 0x1DE18; i <= 0x1DE18; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[3][2]))->TileAddr + i, 0);
  // Stream Switch master config
  for (int i = 0x3F000; i <= 0x3F060; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[3][2]))->TileAddr + i, 0);
  // Stream Switch slave config
  for (int i = 0x3F100; i <= 0x3F168; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[3][2]))->TileAddr + i, 0);
  // Stream Switch slave slot config
  for (int i = 0x3F200; i <= 0x3F3AC; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[3][2]))->TileAddr + i, 0);
  for (int l = 0; l < 16; l++)
    XAieTile_LockRelease(&(ctx->TileInst[3][2]), l, 0x0, 0);
  XAieTile_CoreControl(&(ctx->TileInst[3][3]), XAIE_DISABLE, XAIE_ENABLE);
  // Reset configuration
  // Program Memory
  for (int i = 0x20000; i <= 0x23FFF; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[3][3]))->TileAddr + i, 0);
  // TileDMA
  for (int i = 0x1D000; i <= 0x1D1F8; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[3][3]))->TileAddr + i, 0);
  for (int i = 0x1DE00; i <= 0x1DE00; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[3][3]))->TileAddr + i, 0);
  for (int i = 0x1DE08; i <= 0x1DE08; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[3][3]))->TileAddr + i, 0);
  for (int i = 0x1DE10; i <= 0x1DE10; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[3][3]))->TileAddr + i, 0);
  for (int i = 0x1DE18; i <= 0x1DE18; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[3][3]))->TileAddr + i, 0);
  // Stream Switch master config
  for (int i = 0x3F000; i <= 0x3F060; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[3][3]))->TileAddr + i, 0);
  // Stream Switch slave config
  for (int i = 0x3F100; i <= 0x3F168; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[3][3]))->TileAddr + i, 0);
  // Stream Switch slave slot config
  for (int i = 0x3F200; i <= 0x3F3AC; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[3][3]))->TileAddr + i, 0);
  for (int l = 0; l < 16; l++)
    XAieTile_LockRelease(&(ctx->TileInst[3][3]), l, 0x0, 0);
  XAieTile_ShimColumnReset(&(ctx->TileInst[4][0]), XAIE_RESETENABLE);
  // Reset configuration
  // Stream Switch master config
  for (int i = 0x3F000; i <= 0x3F058; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[4][0]))->TileAddr + i, 0);
  // Stream Switch slave config
  for (int i = 0x3F100; i <= 0x3F15C; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[4][0]))->TileAddr + i, 0);
  // Stream Switch slave slot config
  for (int i = 0x3F200; i <= 0x3F37C; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[4][0]))->TileAddr + i, 0);
  XAieTile_ShimColumnReset(&(ctx->TileInst[4][0]), XAIE_RESETDISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[4][1]), XAIE_DISABLE, XAIE_ENABLE);
  // Reset configuration
  // Program Memory
  for (int i = 0x20000; i <= 0x23FFF; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[4][1]))->TileAddr + i, 0);
  // TileDMA
  for (int i = 0x1D000; i <= 0x1D1F8; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[4][1]))->TileAddr + i, 0);
  for (int i = 0x1DE00; i <= 0x1DE00; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[4][1]))->TileAddr + i, 0);
  for (int i = 0x1DE08; i <= 0x1DE08; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[4][1]))->TileAddr + i, 0);
  for (int i = 0x1DE10; i <= 0x1DE10; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[4][1]))->TileAddr + i, 0);
  for (int i = 0x1DE18; i <= 0x1DE18; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[4][1]))->TileAddr + i, 0);
  // Stream Switch master config
  for (int i = 0x3F000; i <= 0x3F060; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[4][1]))->TileAddr + i, 0);
  // Stream Switch slave config
  for (int i = 0x3F100; i <= 0x3F168; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[4][1]))->TileAddr + i, 0);
  // Stream Switch slave slot config
  for (int i = 0x3F200; i <= 0x3F3AC; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[4][1]))->TileAddr + i, 0);
  for (int l = 0; l < 16; l++)
    XAieTile_LockRelease(&(ctx->TileInst[4][1]), l, 0x0, 0);
  XAieTile_CoreControl(&(ctx->TileInst[4][2]), XAIE_DISABLE, XAIE_ENABLE);
  // Reset configuration
  // Program Memory
  for (int i = 0x20000; i <= 0x23FFF; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[4][2]))->TileAddr + i, 0);
  // TileDMA
  for (int i = 0x1D000; i <= 0x1D1F8; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[4][2]))->TileAddr + i, 0);
  for (int i = 0x1DE00; i <= 0x1DE00; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[4][2]))->TileAddr + i, 0);
  for (int i = 0x1DE08; i <= 0x1DE08; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[4][2]))->TileAddr + i, 0);
  for (int i = 0x1DE10; i <= 0x1DE10; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[4][2]))->TileAddr + i, 0);
  for (int i = 0x1DE18; i <= 0x1DE18; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[4][2]))->TileAddr + i, 0);
  // Stream Switch master config
  for (int i = 0x3F000; i <= 0x3F060; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[4][2]))->TileAddr + i, 0);
  // Stream Switch slave config
  for (int i = 0x3F100; i <= 0x3F168; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[4][2]))->TileAddr + i, 0);
  // Stream Switch slave slot config
  for (int i = 0x3F200; i <= 0x3F3AC; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[4][2]))->TileAddr + i, 0);
  for (int l = 0; l < 16; l++)
    XAieTile_LockRelease(&(ctx->TileInst[4][2]), l, 0x0, 0);
  XAieTile_CoreControl(&(ctx->TileInst[4][3]), XAIE_DISABLE, XAIE_ENABLE);
  // Reset configuration
  // Program Memory
  for (int i = 0x20000; i <= 0x23FFF; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[4][3]))->TileAddr + i, 0);
  // TileDMA
  for (int i = 0x1D000; i <= 0x1D1F8; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[4][3]))->TileAddr + i, 0);
  for (int i = 0x1DE00; i <= 0x1DE00; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[4][3]))->TileAddr + i, 0);
  for (int i = 0x1DE08; i <= 0x1DE08; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[4][3]))->TileAddr + i, 0);
  for (int i = 0x1DE10; i <= 0x1DE10; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[4][3]))->TileAddr + i, 0);
  for (int i = 0x1DE18; i <= 0x1DE18; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[4][3]))->TileAddr + i, 0);
  // Stream Switch master config
  for (int i = 0x3F000; i <= 0x3F060; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[4][3]))->TileAddr + i, 0);
  // Stream Switch slave config
  for (int i = 0x3F100; i <= 0x3F168; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[4][3]))->TileAddr + i, 0);
  // Stream Switch slave slot config
  for (int i = 0x3F200; i <= 0x3F3AC; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[4][3]))->TileAddr + i, 0);
  for (int l = 0; l < 16; l++)
    XAieTile_LockRelease(&(ctx->TileInst[4][3]), l, 0x0, 0);
  XAieTile_ShimColumnReset(&(ctx->TileInst[5][0]), XAIE_RESETENABLE);
  // Reset configuration
  // Stream Switch master config
  for (int i = 0x3F000; i <= 0x3F058; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[5][0]))->TileAddr + i, 0);
  // Stream Switch slave config
  for (int i = 0x3F100; i <= 0x3F15C; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[5][0]))->TileAddr + i, 0);
  // Stream Switch slave slot config
  for (int i = 0x3F200; i <= 0x3F37C; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[5][0]))->TileAddr + i, 0);
  XAieTile_ShimColumnReset(&(ctx->TileInst[5][0]), XAIE_RESETDISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[5][1]), XAIE_DISABLE, XAIE_ENABLE);
  // Reset configuration
  // Program Memory
  for (int i = 0x20000; i <= 0x23FFF; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[5][1]))->TileAddr + i, 0);
  // TileDMA
  for (int i = 0x1D000; i <= 0x1D1F8; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[5][1]))->TileAddr + i, 0);
  for (int i = 0x1DE00; i <= 0x1DE00; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[5][1]))->TileAddr + i, 0);
  for (int i = 0x1DE08; i <= 0x1DE08; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[5][1]))->TileAddr + i, 0);
  for (int i = 0x1DE10; i <= 0x1DE10; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[5][1]))->TileAddr + i, 0);
  for (int i = 0x1DE18; i <= 0x1DE18; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[5][1]))->TileAddr + i, 0);
  // Stream Switch master config
  for (int i = 0x3F000; i <= 0x3F060; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[5][1]))->TileAddr + i, 0);
  // Stream Switch slave config
  for (int i = 0x3F100; i <= 0x3F168; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[5][1]))->TileAddr + i, 0);
  // Stream Switch slave slot config
  for (int i = 0x3F200; i <= 0x3F3AC; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[5][1]))->TileAddr + i, 0);
  for (int l = 0; l < 16; l++)
    XAieTile_LockRelease(&(ctx->TileInst[5][1]), l, 0x0, 0);
  XAieTile_CoreControl(&(ctx->TileInst[5][2]), XAIE_DISABLE, XAIE_ENABLE);
  // Reset configuration
  // Program Memory
  for (int i = 0x20000; i <= 0x23FFF; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[5][2]))->TileAddr + i, 0);
  // TileDMA
  for (int i = 0x1D000; i <= 0x1D1F8; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[5][2]))->TileAddr + i, 0);
  for (int i = 0x1DE00; i <= 0x1DE00; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[5][2]))->TileAddr + i, 0);
  for (int i = 0x1DE08; i <= 0x1DE08; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[5][2]))->TileAddr + i, 0);
  for (int i = 0x1DE10; i <= 0x1DE10; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[5][2]))->TileAddr + i, 0);
  for (int i = 0x1DE18; i <= 0x1DE18; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[5][2]))->TileAddr + i, 0);
  // Stream Switch master config
  for (int i = 0x3F000; i <= 0x3F060; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[5][2]))->TileAddr + i, 0);
  // Stream Switch slave config
  for (int i = 0x3F100; i <= 0x3F168; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[5][2]))->TileAddr + i, 0);
  // Stream Switch slave slot config
  for (int i = 0x3F200; i <= 0x3F3AC; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[5][2]))->TileAddr + i, 0);
  for (int l = 0; l < 16; l++)
    XAieTile_LockRelease(&(ctx->TileInst[5][2]), l, 0x0, 0);
  XAieTile_CoreControl(&(ctx->TileInst[5][3]), XAIE_DISABLE, XAIE_ENABLE);
  // Reset configuration
  // Program Memory
  for (int i = 0x20000; i <= 0x23FFF; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[5][3]))->TileAddr + i, 0);
  // TileDMA
  for (int i = 0x1D000; i <= 0x1D1F8; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[5][3]))->TileAddr + i, 0);
  for (int i = 0x1DE00; i <= 0x1DE00; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[5][3]))->TileAddr + i, 0);
  for (int i = 0x1DE08; i <= 0x1DE08; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[5][3]))->TileAddr + i, 0);
  for (int i = 0x1DE10; i <= 0x1DE10; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[5][3]))->TileAddr + i, 0);
  for (int i = 0x1DE18; i <= 0x1DE18; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[5][3]))->TileAddr + i, 0);
  // Stream Switch master config
  for (int i = 0x3F000; i <= 0x3F060; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[5][3]))->TileAddr + i, 0);
  // Stream Switch slave config
  for (int i = 0x3F100; i <= 0x3F168; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[5][3]))->TileAddr + i, 0);
  // Stream Switch slave slot config
  for (int i = 0x3F200; i <= 0x3F3AC; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[5][3]))->TileAddr + i, 0);
  for (int l = 0; l < 16; l++)
    XAieTile_LockRelease(&(ctx->TileInst[5][3]), l, 0x0, 0);
  XAieTile_ShimColumnReset(&(ctx->TileInst[6][0]), XAIE_RESETENABLE);
  // Reset configuration
  // Reset configuration
  // ShimDMA
  for (int i = 0x1D000; i <= 0x1D13C; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[6][0]))->TileAddr + i, 0);
  for (int i = 0x1D140; i <= 0x1D140; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[6][0]))->TileAddr + i, 0);
  for (int i = 0x1D148; i <= 0x1D148; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[6][0]))->TileAddr + i, 0);
  for (int i = 0x1D150; i <= 0x1D150; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[6][0]))->TileAddr + i, 0);
  for (int i = 0x1D158; i <= 0x1D158; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[6][0]))->TileAddr + i, 0);
  // Stream Switch master config
  for (int i = 0x3F000; i <= 0x3F058; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[6][0]))->TileAddr + i, 0);
  // Stream Switch slave config
  for (int i = 0x3F100; i <= 0x3F15C; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[6][0]))->TileAddr + i, 0);
  // Stream Switch slave slot config
  for (int i = 0x3F200; i <= 0x3F37C; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[6][0]))->TileAddr + i, 0);
  XAieTile_ShimColumnReset(&(ctx->TileInst[6][0]), XAIE_RESETDISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[6][1]), XAIE_DISABLE, XAIE_ENABLE);
  // Reset configuration
  // Program Memory
  for (int i = 0x20000; i <= 0x23FFF; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[6][1]))->TileAddr + i, 0);
  // TileDMA
  for (int i = 0x1D000; i <= 0x1D1F8; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[6][1]))->TileAddr + i, 0);
  for (int i = 0x1DE00; i <= 0x1DE00; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[6][1]))->TileAddr + i, 0);
  for (int i = 0x1DE08; i <= 0x1DE08; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[6][1]))->TileAddr + i, 0);
  for (int i = 0x1DE10; i <= 0x1DE10; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[6][1]))->TileAddr + i, 0);
  for (int i = 0x1DE18; i <= 0x1DE18; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[6][1]))->TileAddr + i, 0);
  // Stream Switch master config
  for (int i = 0x3F000; i <= 0x3F060; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[6][1]))->TileAddr + i, 0);
  // Stream Switch slave config
  for (int i = 0x3F100; i <= 0x3F168; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[6][1]))->TileAddr + i, 0);
  // Stream Switch slave slot config
  for (int i = 0x3F200; i <= 0x3F3AC; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[6][1]))->TileAddr + i, 0);
  for (int l = 0; l < 16; l++)
    XAieTile_LockRelease(&(ctx->TileInst[6][1]), l, 0x0, 0);
  XAieTile_CoreControl(&(ctx->TileInst[6][2]), XAIE_DISABLE, XAIE_ENABLE);
  // Reset configuration
  // Program Memory
  for (int i = 0x20000; i <= 0x23FFF; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[6][2]))->TileAddr + i, 0);
  // TileDMA
  for (int i = 0x1D000; i <= 0x1D1F8; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[6][2]))->TileAddr + i, 0);
  for (int i = 0x1DE00; i <= 0x1DE00; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[6][2]))->TileAddr + i, 0);
  for (int i = 0x1DE08; i <= 0x1DE08; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[6][2]))->TileAddr + i, 0);
  for (int i = 0x1DE10; i <= 0x1DE10; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[6][2]))->TileAddr + i, 0);
  for (int i = 0x1DE18; i <= 0x1DE18; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[6][2]))->TileAddr + i, 0);
  // Stream Switch master config
  for (int i = 0x3F000; i <= 0x3F060; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[6][2]))->TileAddr + i, 0);
  // Stream Switch slave config
  for (int i = 0x3F100; i <= 0x3F168; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[6][2]))->TileAddr + i, 0);
  // Stream Switch slave slot config
  for (int i = 0x3F200; i <= 0x3F3AC; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[6][2]))->TileAddr + i, 0);
  for (int l = 0; l < 16; l++)
    XAieTile_LockRelease(&(ctx->TileInst[6][2]), l, 0x0, 0);
  XAieTile_CoreControl(&(ctx->TileInst[6][3]), XAIE_DISABLE, XAIE_ENABLE);
  // Reset configuration
  // Program Memory
  for (int i = 0x20000; i <= 0x23FFF; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[6][3]))->TileAddr + i, 0);
  // TileDMA
  for (int i = 0x1D000; i <= 0x1D1F8; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[6][3]))->TileAddr + i, 0);
  for (int i = 0x1DE00; i <= 0x1DE00; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[6][3]))->TileAddr + i, 0);
  for (int i = 0x1DE08; i <= 0x1DE08; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[6][3]))->TileAddr + i, 0);
  for (int i = 0x1DE10; i <= 0x1DE10; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[6][3]))->TileAddr + i, 0);
  for (int i = 0x1DE18; i <= 0x1DE18; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[6][3]))->TileAddr + i, 0);
  // Stream Switch master config
  for (int i = 0x3F000; i <= 0x3F060; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[6][3]))->TileAddr + i, 0);
  // Stream Switch slave config
  for (int i = 0x3F100; i <= 0x3F168; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[6][3]))->TileAddr + i, 0);
  // Stream Switch slave slot config
  for (int i = 0x3F200; i <= 0x3F3AC; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[6][3]))->TileAddr + i, 0);
  for (int l = 0; l < 16; l++)
    XAieTile_LockRelease(&(ctx->TileInst[6][3]), l, 0x0, 0);
  XAieTile_ShimColumnReset(&(ctx->TileInst[7][0]), XAIE_RESETENABLE);
  // Reset configuration
  // Reset configuration
  // ShimDMA
  for (int i = 0x1D000; i <= 0x1D13C; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[7][0]))->TileAddr + i, 0);
  for (int i = 0x1D140; i <= 0x1D140; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[7][0]))->TileAddr + i, 0);
  for (int i = 0x1D148; i <= 0x1D148; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[7][0]))->TileAddr + i, 0);
  for (int i = 0x1D150; i <= 0x1D150; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[7][0]))->TileAddr + i, 0);
  for (int i = 0x1D158; i <= 0x1D158; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[7][0]))->TileAddr + i, 0);
  // Stream Switch master config
  for (int i = 0x3F000; i <= 0x3F058; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[7][0]))->TileAddr + i, 0);
  // Stream Switch slave config
  for (int i = 0x3F100; i <= 0x3F15C; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[7][0]))->TileAddr + i, 0);
  // Stream Switch slave slot config
  for (int i = 0x3F200; i <= 0x3F37C; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[7][0]))->TileAddr + i, 0);
  XAieTile_ShimColumnReset(&(ctx->TileInst[7][0]), XAIE_RESETDISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[7][1]), XAIE_DISABLE, XAIE_ENABLE);
  // Reset configuration
  // Program Memory
  for (int i = 0x20000; i <= 0x23FFF; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[7][1]))->TileAddr + i, 0);
  // TileDMA
  for (int i = 0x1D000; i <= 0x1D1F8; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[7][1]))->TileAddr + i, 0);
  for (int i = 0x1DE00; i <= 0x1DE00; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[7][1]))->TileAddr + i, 0);
  for (int i = 0x1DE08; i <= 0x1DE08; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[7][1]))->TileAddr + i, 0);
  for (int i = 0x1DE10; i <= 0x1DE10; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[7][1]))->TileAddr + i, 0);
  for (int i = 0x1DE18; i <= 0x1DE18; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[7][1]))->TileAddr + i, 0);
  // Stream Switch master config
  for (int i = 0x3F000; i <= 0x3F060; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[7][1]))->TileAddr + i, 0);
  // Stream Switch slave config
  for (int i = 0x3F100; i <= 0x3F168; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[7][1]))->TileAddr + i, 0);
  // Stream Switch slave slot config
  for (int i = 0x3F200; i <= 0x3F3AC; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[7][1]))->TileAddr + i, 0);
  for (int l = 0; l < 16; l++)
    XAieTile_LockRelease(&(ctx->TileInst[7][1]), l, 0x0, 0);
  XAieTile_CoreControl(&(ctx->TileInst[7][2]), XAIE_DISABLE, XAIE_ENABLE);
  // Reset configuration
  // Program Memory
  for (int i = 0x20000; i <= 0x23FFF; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[7][2]))->TileAddr + i, 0);
  // TileDMA
  for (int i = 0x1D000; i <= 0x1D1F8; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[7][2]))->TileAddr + i, 0);
  for (int i = 0x1DE00; i <= 0x1DE00; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[7][2]))->TileAddr + i, 0);
  for (int i = 0x1DE08; i <= 0x1DE08; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[7][2]))->TileAddr + i, 0);
  for (int i = 0x1DE10; i <= 0x1DE10; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[7][2]))->TileAddr + i, 0);
  for (int i = 0x1DE18; i <= 0x1DE18; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[7][2]))->TileAddr + i, 0);
  // Stream Switch master config
  for (int i = 0x3F000; i <= 0x3F060; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[7][2]))->TileAddr + i, 0);
  // Stream Switch slave config
  for (int i = 0x3F100; i <= 0x3F168; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[7][2]))->TileAddr + i, 0);
  // Stream Switch slave slot config
  for (int i = 0x3F200; i <= 0x3F3AC; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[7][2]))->TileAddr + i, 0);
  for (int l = 0; l < 16; l++)
    XAieTile_LockRelease(&(ctx->TileInst[7][2]), l, 0x0, 0);
  XAieTile_CoreControl(&(ctx->TileInst[7][3]), XAIE_DISABLE, XAIE_ENABLE);
  // Reset configuration
  // Program Memory
  for (int i = 0x20000; i <= 0x23FFF; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[7][3]))->TileAddr + i, 0);
  // TileDMA
  for (int i = 0x1D000; i <= 0x1D1F8; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[7][3]))->TileAddr + i, 0);
  for (int i = 0x1DE00; i <= 0x1DE00; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[7][3]))->TileAddr + i, 0);
  for (int i = 0x1DE08; i <= 0x1DE08; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[7][3]))->TileAddr + i, 0);
  for (int i = 0x1DE10; i <= 0x1DE10; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[7][3]))->TileAddr + i, 0);
  for (int i = 0x1DE18; i <= 0x1DE18; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[7][3]))->TileAddr + i, 0);
  // Stream Switch master config
  for (int i = 0x3F000; i <= 0x3F060; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[7][3]))->TileAddr + i, 0);
  // Stream Switch slave config
  for (int i = 0x3F100; i <= 0x3F168; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[7][3]))->TileAddr + i, 0);
  // Stream Switch slave slot config
  for (int i = 0x3F200; i <= 0x3F3AC; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[7][3]))->TileAddr + i, 0);
  for (int l = 0; l < 16; l++)
    XAieTile_LockRelease(&(ctx->TileInst[7][3]), l, 0x0, 0);
  XAieTile_ShimColumnReset(&(ctx->TileInst[8][0]), XAIE_RESETENABLE);
  // Reset configuration
  // Stream Switch master config
  for (int i = 0x3F000; i <= 0x3F058; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[8][0]))->TileAddr + i, 0);
  // Stream Switch slave config
  for (int i = 0x3F100; i <= 0x3F15C; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[8][0]))->TileAddr + i, 0);
  // Stream Switch slave slot config
  for (int i = 0x3F200; i <= 0x3F37C; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[8][0]))->TileAddr + i, 0);
  XAieTile_ShimColumnReset(&(ctx->TileInst[8][0]), XAIE_RESETDISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[8][1]), XAIE_DISABLE, XAIE_ENABLE);
  // Reset configuration
  // Program Memory
  for (int i = 0x20000; i <= 0x23FFF; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[8][1]))->TileAddr + i, 0);
  // TileDMA
  for (int i = 0x1D000; i <= 0x1D1F8; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[8][1]))->TileAddr + i, 0);
  for (int i = 0x1DE00; i <= 0x1DE00; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[8][1]))->TileAddr + i, 0);
  for (int i = 0x1DE08; i <= 0x1DE08; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[8][1]))->TileAddr + i, 0);
  for (int i = 0x1DE10; i <= 0x1DE10; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[8][1]))->TileAddr + i, 0);
  for (int i = 0x1DE18; i <= 0x1DE18; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[8][1]))->TileAddr + i, 0);
  // Stream Switch master config
  for (int i = 0x3F000; i <= 0x3F060; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[8][1]))->TileAddr + i, 0);
  // Stream Switch slave config
  for (int i = 0x3F100; i <= 0x3F168; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[8][1]))->TileAddr + i, 0);
  // Stream Switch slave slot config
  for (int i = 0x3F200; i <= 0x3F3AC; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[8][1]))->TileAddr + i, 0);
  for (int l = 0; l < 16; l++)
    XAieTile_LockRelease(&(ctx->TileInst[8][1]), l, 0x0, 0);
  XAieTile_CoreControl(&(ctx->TileInst[8][2]), XAIE_DISABLE, XAIE_ENABLE);
  // Reset configuration
  // Program Memory
  for (int i = 0x20000; i <= 0x23FFF; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[8][2]))->TileAddr + i, 0);
  // TileDMA
  for (int i = 0x1D000; i <= 0x1D1F8; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[8][2]))->TileAddr + i, 0);
  for (int i = 0x1DE00; i <= 0x1DE00; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[8][2]))->TileAddr + i, 0);
  for (int i = 0x1DE08; i <= 0x1DE08; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[8][2]))->TileAddr + i, 0);
  for (int i = 0x1DE10; i <= 0x1DE10; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[8][2]))->TileAddr + i, 0);
  for (int i = 0x1DE18; i <= 0x1DE18; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[8][2]))->TileAddr + i, 0);
  // Stream Switch master config
  for (int i = 0x3F000; i <= 0x3F060; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[8][2]))->TileAddr + i, 0);
  // Stream Switch slave config
  for (int i = 0x3F100; i <= 0x3F168; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[8][2]))->TileAddr + i, 0);
  // Stream Switch slave slot config
  for (int i = 0x3F200; i <= 0x3F3AC; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[8][2]))->TileAddr + i, 0);
  for (int l = 0; l < 16; l++)
    XAieTile_LockRelease(&(ctx->TileInst[8][2]), l, 0x0, 0);
  XAieTile_CoreControl(&(ctx->TileInst[8][3]), XAIE_DISABLE, XAIE_ENABLE);
  // Reset configuration
  // Program Memory
  for (int i = 0x20000; i <= 0x23FFF; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[8][3]))->TileAddr + i, 0);
  // TileDMA
  for (int i = 0x1D000; i <= 0x1D1F8; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[8][3]))->TileAddr + i, 0);
  for (int i = 0x1DE00; i <= 0x1DE00; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[8][3]))->TileAddr + i, 0);
  for (int i = 0x1DE08; i <= 0x1DE08; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[8][3]))->TileAddr + i, 0);
  for (int i = 0x1DE10; i <= 0x1DE10; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[8][3]))->TileAddr + i, 0);
  for (int i = 0x1DE18; i <= 0x1DE18; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[8][3]))->TileAddr + i, 0);
  // Stream Switch master config
  for (int i = 0x3F000; i <= 0x3F060; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[8][3]))->TileAddr + i, 0);
  // Stream Switch slave config
  for (int i = 0x3F100; i <= 0x3F168; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[8][3]))->TileAddr + i, 0);
  // Stream Switch slave slot config
  for (int i = 0x3F200; i <= 0x3F3AC; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[8][3]))->TileAddr + i, 0);
  for (int l = 0; l < 16; l++)
    XAieTile_LockRelease(&(ctx->TileInst[8][3]), l, 0x0, 0);
  XAieTile_ShimColumnReset(&(ctx->TileInst[9][0]), XAIE_RESETENABLE);
  // Reset configuration
  // Stream Switch master config
  for (int i = 0x3F000; i <= 0x3F058; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[9][0]))->TileAddr + i, 0);
  // Stream Switch slave config
  for (int i = 0x3F100; i <= 0x3F15C; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[9][0]))->TileAddr + i, 0);
  // Stream Switch slave slot config
  for (int i = 0x3F200; i <= 0x3F37C; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[9][0]))->TileAddr + i, 0);
  XAieTile_ShimColumnReset(&(ctx->TileInst[9][0]), XAIE_RESETDISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[9][1]), XAIE_DISABLE, XAIE_ENABLE);
  // Reset configuration
  // Program Memory
  for (int i = 0x20000; i <= 0x23FFF; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[9][1]))->TileAddr + i, 0);
  // TileDMA
  for (int i = 0x1D000; i <= 0x1D1F8; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[9][1]))->TileAddr + i, 0);
  for (int i = 0x1DE00; i <= 0x1DE00; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[9][1]))->TileAddr + i, 0);
  for (int i = 0x1DE08; i <= 0x1DE08; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[9][1]))->TileAddr + i, 0);
  for (int i = 0x1DE10; i <= 0x1DE10; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[9][1]))->TileAddr + i, 0);
  for (int i = 0x1DE18; i <= 0x1DE18; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[9][1]))->TileAddr + i, 0);
  // Stream Switch master config
  for (int i = 0x3F000; i <= 0x3F060; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[9][1]))->TileAddr + i, 0);
  // Stream Switch slave config
  for (int i = 0x3F100; i <= 0x3F168; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[9][1]))->TileAddr + i, 0);
  // Stream Switch slave slot config
  for (int i = 0x3F200; i <= 0x3F3AC; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[9][1]))->TileAddr + i, 0);
  for (int l = 0; l < 16; l++)
    XAieTile_LockRelease(&(ctx->TileInst[9][1]), l, 0x0, 0);
  XAieTile_CoreControl(&(ctx->TileInst[9][2]), XAIE_DISABLE, XAIE_ENABLE);
  // Reset configuration
  // Program Memory
  for (int i = 0x20000; i <= 0x23FFF; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[9][2]))->TileAddr + i, 0);
  // TileDMA
  for (int i = 0x1D000; i <= 0x1D1F8; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[9][2]))->TileAddr + i, 0);
  for (int i = 0x1DE00; i <= 0x1DE00; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[9][2]))->TileAddr + i, 0);
  for (int i = 0x1DE08; i <= 0x1DE08; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[9][2]))->TileAddr + i, 0);
  for (int i = 0x1DE10; i <= 0x1DE10; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[9][2]))->TileAddr + i, 0);
  for (int i = 0x1DE18; i <= 0x1DE18; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[9][2]))->TileAddr + i, 0);
  // Stream Switch master config
  for (int i = 0x3F000; i <= 0x3F060; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[9][2]))->TileAddr + i, 0);
  // Stream Switch slave config
  for (int i = 0x3F100; i <= 0x3F168; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[9][2]))->TileAddr + i, 0);
  // Stream Switch slave slot config
  for (int i = 0x3F200; i <= 0x3F3AC; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[9][2]))->TileAddr + i, 0);
  for (int l = 0; l < 16; l++)
    XAieTile_LockRelease(&(ctx->TileInst[9][2]), l, 0x0, 0);
  XAieTile_CoreControl(&(ctx->TileInst[9][3]), XAIE_DISABLE, XAIE_ENABLE);
  // Reset configuration
  // Program Memory
  for (int i = 0x20000; i <= 0x23FFF; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[9][3]))->TileAddr + i, 0);
  // TileDMA
  for (int i = 0x1D000; i <= 0x1D1F8; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[9][3]))->TileAddr + i, 0);
  for (int i = 0x1DE00; i <= 0x1DE00; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[9][3]))->TileAddr + i, 0);
  for (int i = 0x1DE08; i <= 0x1DE08; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[9][3]))->TileAddr + i, 0);
  for (int i = 0x1DE10; i <= 0x1DE10; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[9][3]))->TileAddr + i, 0);
  for (int i = 0x1DE18; i <= 0x1DE18; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[9][3]))->TileAddr + i, 0);
  // Stream Switch master config
  for (int i = 0x3F000; i <= 0x3F060; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[9][3]))->TileAddr + i, 0);
  // Stream Switch slave config
  for (int i = 0x3F100; i <= 0x3F168; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[9][3]))->TileAddr + i, 0);
  // Stream Switch slave slot config
  for (int i = 0x3F200; i <= 0x3F3AC; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[9][3]))->TileAddr + i, 0);
  for (int l = 0; l < 16; l++)
    XAieTile_LockRelease(&(ctx->TileInst[9][3]), l, 0x0, 0);
  XAieTile_ShimColumnReset(&(ctx->TileInst[10][0]), XAIE_RESETENABLE);
  // Reset configuration
  // Reset configuration
  // ShimDMA
  for (int i = 0x1D000; i <= 0x1D13C; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[10][0]))->TileAddr + i, 0);
  for (int i = 0x1D140; i <= 0x1D140; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[10][0]))->TileAddr + i, 0);
  for (int i = 0x1D148; i <= 0x1D148; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[10][0]))->TileAddr + i, 0);
  for (int i = 0x1D150; i <= 0x1D150; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[10][0]))->TileAddr + i, 0);
  for (int i = 0x1D158; i <= 0x1D158; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[10][0]))->TileAddr + i, 0);
  // Stream Switch master config
  for (int i = 0x3F000; i <= 0x3F058; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[10][0]))->TileAddr + i, 0);
  // Stream Switch slave config
  for (int i = 0x3F100; i <= 0x3F15C; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[10][0]))->TileAddr + i, 0);
  // Stream Switch slave slot config
  for (int i = 0x3F200; i <= 0x3F37C; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[10][0]))->TileAddr + i, 0);
  XAieTile_ShimColumnReset(&(ctx->TileInst[10][0]), XAIE_RESETDISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[10][1]), XAIE_DISABLE, XAIE_ENABLE);
  // Reset configuration
  // Program Memory
  for (int i = 0x20000; i <= 0x23FFF; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[10][1]))->TileAddr + i, 0);
  // TileDMA
  for (int i = 0x1D000; i <= 0x1D1F8; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[10][1]))->TileAddr + i, 0);
  for (int i = 0x1DE00; i <= 0x1DE00; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[10][1]))->TileAddr + i, 0);
  for (int i = 0x1DE08; i <= 0x1DE08; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[10][1]))->TileAddr + i, 0);
  for (int i = 0x1DE10; i <= 0x1DE10; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[10][1]))->TileAddr + i, 0);
  for (int i = 0x1DE18; i <= 0x1DE18; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[10][1]))->TileAddr + i, 0);
  // Stream Switch master config
  for (int i = 0x3F000; i <= 0x3F060; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[10][1]))->TileAddr + i, 0);
  // Stream Switch slave config
  for (int i = 0x3F100; i <= 0x3F168; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[10][1]))->TileAddr + i, 0);
  // Stream Switch slave slot config
  for (int i = 0x3F200; i <= 0x3F3AC; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[10][1]))->TileAddr + i, 0);
  for (int l = 0; l < 16; l++)
    XAieTile_LockRelease(&(ctx->TileInst[10][1]), l, 0x0, 0);
  XAieTile_CoreControl(&(ctx->TileInst[10][2]), XAIE_DISABLE, XAIE_ENABLE);
  // Reset configuration
  // Program Memory
  for (int i = 0x20000; i <= 0x23FFF; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[10][2]))->TileAddr + i, 0);
  // TileDMA
  for (int i = 0x1D000; i <= 0x1D1F8; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[10][2]))->TileAddr + i, 0);
  for (int i = 0x1DE00; i <= 0x1DE00; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[10][2]))->TileAddr + i, 0);
  for (int i = 0x1DE08; i <= 0x1DE08; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[10][2]))->TileAddr + i, 0);
  for (int i = 0x1DE10; i <= 0x1DE10; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[10][2]))->TileAddr + i, 0);
  for (int i = 0x1DE18; i <= 0x1DE18; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[10][2]))->TileAddr + i, 0);
  // Stream Switch master config
  for (int i = 0x3F000; i <= 0x3F060; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[10][2]))->TileAddr + i, 0);
  // Stream Switch slave config
  for (int i = 0x3F100; i <= 0x3F168; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[10][2]))->TileAddr + i, 0);
  // Stream Switch slave slot config
  for (int i = 0x3F200; i <= 0x3F3AC; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[10][2]))->TileAddr + i, 0);
  for (int l = 0; l < 16; l++)
    XAieTile_LockRelease(&(ctx->TileInst[10][2]), l, 0x0, 0);
  XAieTile_CoreControl(&(ctx->TileInst[10][3]), XAIE_DISABLE, XAIE_ENABLE);
  // Reset configuration
  // Program Memory
  for (int i = 0x20000; i <= 0x23FFF; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[10][3]))->TileAddr + i, 0);
  // TileDMA
  for (int i = 0x1D000; i <= 0x1D1F8; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[10][3]))->TileAddr + i, 0);
  for (int i = 0x1DE00; i <= 0x1DE00; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[10][3]))->TileAddr + i, 0);
  for (int i = 0x1DE08; i <= 0x1DE08; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[10][3]))->TileAddr + i, 0);
  for (int i = 0x1DE10; i <= 0x1DE10; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[10][3]))->TileAddr + i, 0);
  for (int i = 0x1DE18; i <= 0x1DE18; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[10][3]))->TileAddr + i, 0);
  // Stream Switch master config
  for (int i = 0x3F000; i <= 0x3F060; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[10][3]))->TileAddr + i, 0);
  // Stream Switch slave config
  for (int i = 0x3F100; i <= 0x3F168; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[10][3]))->TileAddr + i, 0);
  // Stream Switch slave slot config
  for (int i = 0x3F200; i <= 0x3F3AC; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[10][3]))->TileAddr + i, 0);
  for (int l = 0; l < 16; l++)
    XAieTile_LockRelease(&(ctx->TileInst[10][3]), l, 0x0, 0);
  XAieTile_ShimColumnReset(&(ctx->TileInst[11][0]), XAIE_RESETENABLE);
  // Reset configuration
  // Reset configuration
  // ShimDMA
  for (int i = 0x1D000; i <= 0x1D13C; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[11][0]))->TileAddr + i, 0);
  for (int i = 0x1D140; i <= 0x1D140; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[11][0]))->TileAddr + i, 0);
  for (int i = 0x1D148; i <= 0x1D148; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[11][0]))->TileAddr + i, 0);
  for (int i = 0x1D150; i <= 0x1D150; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[11][0]))->TileAddr + i, 0);
  for (int i = 0x1D158; i <= 0x1D158; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[11][0]))->TileAddr + i, 0);
  // Stream Switch master config
  for (int i = 0x3F000; i <= 0x3F058; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[11][0]))->TileAddr + i, 0);
  // Stream Switch slave config
  for (int i = 0x3F100; i <= 0x3F15C; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[11][0]))->TileAddr + i, 0);
  // Stream Switch slave slot config
  for (int i = 0x3F200; i <= 0x3F37C; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[11][0]))->TileAddr + i, 0);
  XAieTile_ShimColumnReset(&(ctx->TileInst[11][0]), XAIE_RESETDISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[11][1]), XAIE_DISABLE, XAIE_ENABLE);
  // Reset configuration
  // Program Memory
  for (int i = 0x20000; i <= 0x23FFF; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[11][1]))->TileAddr + i, 0);
  // TileDMA
  for (int i = 0x1D000; i <= 0x1D1F8; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[11][1]))->TileAddr + i, 0);
  for (int i = 0x1DE00; i <= 0x1DE00; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[11][1]))->TileAddr + i, 0);
  for (int i = 0x1DE08; i <= 0x1DE08; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[11][1]))->TileAddr + i, 0);
  for (int i = 0x1DE10; i <= 0x1DE10; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[11][1]))->TileAddr + i, 0);
  for (int i = 0x1DE18; i <= 0x1DE18; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[11][1]))->TileAddr + i, 0);
  // Stream Switch master config
  for (int i = 0x3F000; i <= 0x3F060; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[11][1]))->TileAddr + i, 0);
  // Stream Switch slave config
  for (int i = 0x3F100; i <= 0x3F168; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[11][1]))->TileAddr + i, 0);
  // Stream Switch slave slot config
  for (int i = 0x3F200; i <= 0x3F3AC; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[11][1]))->TileAddr + i, 0);
  for (int l = 0; l < 16; l++)
    XAieTile_LockRelease(&(ctx->TileInst[11][1]), l, 0x0, 0);
  XAieTile_CoreControl(&(ctx->TileInst[11][2]), XAIE_DISABLE, XAIE_ENABLE);
  // Reset configuration
  // Program Memory
  for (int i = 0x20000; i <= 0x23FFF; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[11][2]))->TileAddr + i, 0);
  // TileDMA
  for (int i = 0x1D000; i <= 0x1D1F8; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[11][2]))->TileAddr + i, 0);
  for (int i = 0x1DE00; i <= 0x1DE00; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[11][2]))->TileAddr + i, 0);
  for (int i = 0x1DE08; i <= 0x1DE08; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[11][2]))->TileAddr + i, 0);
  for (int i = 0x1DE10; i <= 0x1DE10; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[11][2]))->TileAddr + i, 0);
  for (int i = 0x1DE18; i <= 0x1DE18; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[11][2]))->TileAddr + i, 0);
  // Stream Switch master config
  for (int i = 0x3F000; i <= 0x3F060; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[11][2]))->TileAddr + i, 0);
  // Stream Switch slave config
  for (int i = 0x3F100; i <= 0x3F168; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[11][2]))->TileAddr + i, 0);
  // Stream Switch slave slot config
  for (int i = 0x3F200; i <= 0x3F3AC; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[11][2]))->TileAddr + i, 0);
  for (int l = 0; l < 16; l++)
    XAieTile_LockRelease(&(ctx->TileInst[11][2]), l, 0x0, 0);
  XAieTile_CoreControl(&(ctx->TileInst[11][3]), XAIE_DISABLE, XAIE_ENABLE);
  // Reset configuration
  // Program Memory
  for (int i = 0x20000; i <= 0x23FFF; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[11][3]))->TileAddr + i, 0);
  // TileDMA
  for (int i = 0x1D000; i <= 0x1D1F8; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[11][3]))->TileAddr + i, 0);
  for (int i = 0x1DE00; i <= 0x1DE00; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[11][3]))->TileAddr + i, 0);
  for (int i = 0x1DE08; i <= 0x1DE08; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[11][3]))->TileAddr + i, 0);
  for (int i = 0x1DE10; i <= 0x1DE10; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[11][3]))->TileAddr + i, 0);
  for (int i = 0x1DE18; i <= 0x1DE18; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[11][3]))->TileAddr + i, 0);
  // Stream Switch master config
  for (int i = 0x3F000; i <= 0x3F060; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[11][3]))->TileAddr + i, 0);
  // Stream Switch slave config
  for (int i = 0x3F100; i <= 0x3F168; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[11][3]))->TileAddr + i, 0);
  // Stream Switch slave slot config
  for (int i = 0x3F200; i <= 0x3F3AC; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[11][3]))->TileAddr + i, 0);
  for (int l = 0; l < 16; l++)
    XAieTile_LockRelease(&(ctx->TileInst[11][3]), l, 0x0, 0);
  XAieTile_ShimColumnReset(&(ctx->TileInst[12][0]), XAIE_RESETENABLE);
  // Reset configuration
  // Stream Switch master config
  for (int i = 0x3F000; i <= 0x3F058; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[12][0]))->TileAddr + i, 0);
  // Stream Switch slave config
  for (int i = 0x3F100; i <= 0x3F15C; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[12][0]))->TileAddr + i, 0);
  // Stream Switch slave slot config
  for (int i = 0x3F200; i <= 0x3F37C; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[12][0]))->TileAddr + i, 0);
  XAieTile_ShimColumnReset(&(ctx->TileInst[12][0]), XAIE_RESETDISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[12][1]), XAIE_DISABLE, XAIE_ENABLE);
  // Reset configuration
  // Program Memory
  for (int i = 0x20000; i <= 0x23FFF; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[12][1]))->TileAddr + i, 0);
  // TileDMA
  for (int i = 0x1D000; i <= 0x1D1F8; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[12][1]))->TileAddr + i, 0);
  for (int i = 0x1DE00; i <= 0x1DE00; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[12][1]))->TileAddr + i, 0);
  for (int i = 0x1DE08; i <= 0x1DE08; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[12][1]))->TileAddr + i, 0);
  for (int i = 0x1DE10; i <= 0x1DE10; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[12][1]))->TileAddr + i, 0);
  for (int i = 0x1DE18; i <= 0x1DE18; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[12][1]))->TileAddr + i, 0);
  // Stream Switch master config
  for (int i = 0x3F000; i <= 0x3F060; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[12][1]))->TileAddr + i, 0);
  // Stream Switch slave config
  for (int i = 0x3F100; i <= 0x3F168; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[12][1]))->TileAddr + i, 0);
  // Stream Switch slave slot config
  for (int i = 0x3F200; i <= 0x3F3AC; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[12][1]))->TileAddr + i, 0);
  for (int l = 0; l < 16; l++)
    XAieTile_LockRelease(&(ctx->TileInst[12][1]), l, 0x0, 0);
  XAieTile_CoreControl(&(ctx->TileInst[12][2]), XAIE_DISABLE, XAIE_ENABLE);
  // Reset configuration
  // Program Memory
  for (int i = 0x20000; i <= 0x23FFF; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[12][2]))->TileAddr + i, 0);
  // TileDMA
  for (int i = 0x1D000; i <= 0x1D1F8; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[12][2]))->TileAddr + i, 0);
  for (int i = 0x1DE00; i <= 0x1DE00; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[12][2]))->TileAddr + i, 0);
  for (int i = 0x1DE08; i <= 0x1DE08; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[12][2]))->TileAddr + i, 0);
  for (int i = 0x1DE10; i <= 0x1DE10; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[12][2]))->TileAddr + i, 0);
  for (int i = 0x1DE18; i <= 0x1DE18; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[12][2]))->TileAddr + i, 0);
  // Stream Switch master config
  for (int i = 0x3F000; i <= 0x3F060; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[12][2]))->TileAddr + i, 0);
  // Stream Switch slave config
  for (int i = 0x3F100; i <= 0x3F168; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[12][2]))->TileAddr + i, 0);
  // Stream Switch slave slot config
  for (int i = 0x3F200; i <= 0x3F3AC; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[12][2]))->TileAddr + i, 0);
  for (int l = 0; l < 16; l++)
    XAieTile_LockRelease(&(ctx->TileInst[12][2]), l, 0x0, 0);
  XAieTile_CoreControl(&(ctx->TileInst[12][3]), XAIE_DISABLE, XAIE_ENABLE);
  // Reset configuration
  // Program Memory
  for (int i = 0x20000; i <= 0x23FFF; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[12][3]))->TileAddr + i, 0);
  // TileDMA
  for (int i = 0x1D000; i <= 0x1D1F8; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[12][3]))->TileAddr + i, 0);
  for (int i = 0x1DE00; i <= 0x1DE00; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[12][3]))->TileAddr + i, 0);
  for (int i = 0x1DE08; i <= 0x1DE08; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[12][3]))->TileAddr + i, 0);
  for (int i = 0x1DE10; i <= 0x1DE10; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[12][3]))->TileAddr + i, 0);
  for (int i = 0x1DE18; i <= 0x1DE18; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[12][3]))->TileAddr + i, 0);
  // Stream Switch master config
  for (int i = 0x3F000; i <= 0x3F060; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[12][3]))->TileAddr + i, 0);
  // Stream Switch slave config
  for (int i = 0x3F100; i <= 0x3F168; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[12][3]))->TileAddr + i, 0);
  // Stream Switch slave slot config
  for (int i = 0x3F200; i <= 0x3F3AC; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[12][3]))->TileAddr + i, 0);
  for (int l = 0; l < 16; l++)
    XAieTile_LockRelease(&(ctx->TileInst[12][3]), l, 0x0, 0);
  XAieTile_ShimColumnReset(&(ctx->TileInst[13][0]), XAIE_RESETENABLE);
  // Reset configuration
  // Stream Switch master config
  for (int i = 0x3F000; i <= 0x3F058; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[13][0]))->TileAddr + i, 0);
  // Stream Switch slave config
  for (int i = 0x3F100; i <= 0x3F15C; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[13][0]))->TileAddr + i, 0);
  // Stream Switch slave slot config
  for (int i = 0x3F200; i <= 0x3F37C; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[13][0]))->TileAddr + i, 0);
  XAieTile_ShimColumnReset(&(ctx->TileInst[13][0]), XAIE_RESETDISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[13][1]), XAIE_DISABLE, XAIE_ENABLE);
  // Reset configuration
  // Program Memory
  for (int i = 0x20000; i <= 0x23FFF; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[13][1]))->TileAddr + i, 0);
  // TileDMA
  for (int i = 0x1D000; i <= 0x1D1F8; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[13][1]))->TileAddr + i, 0);
  for (int i = 0x1DE00; i <= 0x1DE00; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[13][1]))->TileAddr + i, 0);
  for (int i = 0x1DE08; i <= 0x1DE08; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[13][1]))->TileAddr + i, 0);
  for (int i = 0x1DE10; i <= 0x1DE10; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[13][1]))->TileAddr + i, 0);
  for (int i = 0x1DE18; i <= 0x1DE18; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[13][1]))->TileAddr + i, 0);
  // Stream Switch master config
  for (int i = 0x3F000; i <= 0x3F060; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[13][1]))->TileAddr + i, 0);
  // Stream Switch slave config
  for (int i = 0x3F100; i <= 0x3F168; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[13][1]))->TileAddr + i, 0);
  // Stream Switch slave slot config
  for (int i = 0x3F200; i <= 0x3F3AC; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[13][1]))->TileAddr + i, 0);
  for (int l = 0; l < 16; l++)
    XAieTile_LockRelease(&(ctx->TileInst[13][1]), l, 0x0, 0);
  XAieTile_CoreControl(&(ctx->TileInst[13][2]), XAIE_DISABLE, XAIE_ENABLE);
  // Reset configuration
  // Program Memory
  for (int i = 0x20000; i <= 0x23FFF; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[13][2]))->TileAddr + i, 0);
  // TileDMA
  for (int i = 0x1D000; i <= 0x1D1F8; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[13][2]))->TileAddr + i, 0);
  for (int i = 0x1DE00; i <= 0x1DE00; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[13][2]))->TileAddr + i, 0);
  for (int i = 0x1DE08; i <= 0x1DE08; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[13][2]))->TileAddr + i, 0);
  for (int i = 0x1DE10; i <= 0x1DE10; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[13][2]))->TileAddr + i, 0);
  for (int i = 0x1DE18; i <= 0x1DE18; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[13][2]))->TileAddr + i, 0);
  // Stream Switch master config
  for (int i = 0x3F000; i <= 0x3F060; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[13][2]))->TileAddr + i, 0);
  // Stream Switch slave config
  for (int i = 0x3F100; i <= 0x3F168; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[13][2]))->TileAddr + i, 0);
  // Stream Switch slave slot config
  for (int i = 0x3F200; i <= 0x3F3AC; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[13][2]))->TileAddr + i, 0);
  for (int l = 0; l < 16; l++)
    XAieTile_LockRelease(&(ctx->TileInst[13][2]), l, 0x0, 0);
  XAieTile_CoreControl(&(ctx->TileInst[13][3]), XAIE_DISABLE, XAIE_ENABLE);
  // Reset configuration
  // Program Memory
  for (int i = 0x20000; i <= 0x23FFF; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[13][3]))->TileAddr + i, 0);
  // TileDMA
  for (int i = 0x1D000; i <= 0x1D1F8; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[13][3]))->TileAddr + i, 0);
  for (int i = 0x1DE00; i <= 0x1DE00; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[13][3]))->TileAddr + i, 0);
  for (int i = 0x1DE08; i <= 0x1DE08; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[13][3]))->TileAddr + i, 0);
  for (int i = 0x1DE10; i <= 0x1DE10; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[13][3]))->TileAddr + i, 0);
  for (int i = 0x1DE18; i <= 0x1DE18; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[13][3]))->TileAddr + i, 0);
  // Stream Switch master config
  for (int i = 0x3F000; i <= 0x3F060; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[13][3]))->TileAddr + i, 0);
  // Stream Switch slave config
  for (int i = 0x3F100; i <= 0x3F168; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[13][3]))->TileAddr + i, 0);
  // Stream Switch slave slot config
  for (int i = 0x3F200; i <= 0x3F3AC; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[13][3]))->TileAddr + i, 0);
  for (int l = 0; l < 16; l++)
    XAieTile_LockRelease(&(ctx->TileInst[13][3]), l, 0x0, 0);
  XAieTile_ShimColumnReset(&(ctx->TileInst[14][0]), XAIE_RESETENABLE);
  // Reset configuration
  // Stream Switch master config
  for (int i = 0x3F000; i <= 0x3F058; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[14][0]))->TileAddr + i, 0);
  // Stream Switch slave config
  for (int i = 0x3F100; i <= 0x3F15C; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[14][0]))->TileAddr + i, 0);
  // Stream Switch slave slot config
  for (int i = 0x3F200; i <= 0x3F37C; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[14][0]))->TileAddr + i, 0);
  XAieTile_ShimColumnReset(&(ctx->TileInst[14][0]), XAIE_RESETDISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[14][1]), XAIE_DISABLE, XAIE_ENABLE);
  // Reset configuration
  // Program Memory
  for (int i = 0x20000; i <= 0x23FFF; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[14][1]))->TileAddr + i, 0);
  // TileDMA
  for (int i = 0x1D000; i <= 0x1D1F8; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[14][1]))->TileAddr + i, 0);
  for (int i = 0x1DE00; i <= 0x1DE00; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[14][1]))->TileAddr + i, 0);
  for (int i = 0x1DE08; i <= 0x1DE08; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[14][1]))->TileAddr + i, 0);
  for (int i = 0x1DE10; i <= 0x1DE10; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[14][1]))->TileAddr + i, 0);
  for (int i = 0x1DE18; i <= 0x1DE18; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[14][1]))->TileAddr + i, 0);
  // Stream Switch master config
  for (int i = 0x3F000; i <= 0x3F060; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[14][1]))->TileAddr + i, 0);
  // Stream Switch slave config
  for (int i = 0x3F100; i <= 0x3F168; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[14][1]))->TileAddr + i, 0);
  // Stream Switch slave slot config
  for (int i = 0x3F200; i <= 0x3F3AC; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[14][1]))->TileAddr + i, 0);
  for (int l = 0; l < 16; l++)
    XAieTile_LockRelease(&(ctx->TileInst[14][1]), l, 0x0, 0);
  XAieTile_CoreControl(&(ctx->TileInst[14][2]), XAIE_DISABLE, XAIE_ENABLE);
  // Reset configuration
  // Program Memory
  for (int i = 0x20000; i <= 0x23FFF; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[14][2]))->TileAddr + i, 0);
  // TileDMA
  for (int i = 0x1D000; i <= 0x1D1F8; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[14][2]))->TileAddr + i, 0);
  for (int i = 0x1DE00; i <= 0x1DE00; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[14][2]))->TileAddr + i, 0);
  for (int i = 0x1DE08; i <= 0x1DE08; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[14][2]))->TileAddr + i, 0);
  for (int i = 0x1DE10; i <= 0x1DE10; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[14][2]))->TileAddr + i, 0);
  for (int i = 0x1DE18; i <= 0x1DE18; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[14][2]))->TileAddr + i, 0);
  // Stream Switch master config
  for (int i = 0x3F000; i <= 0x3F060; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[14][2]))->TileAddr + i, 0);
  // Stream Switch slave config
  for (int i = 0x3F100; i <= 0x3F168; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[14][2]))->TileAddr + i, 0);
  // Stream Switch slave slot config
  for (int i = 0x3F200; i <= 0x3F3AC; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[14][2]))->TileAddr + i, 0);
  for (int l = 0; l < 16; l++)
    XAieTile_LockRelease(&(ctx->TileInst[14][2]), l, 0x0, 0);
  XAieTile_CoreControl(&(ctx->TileInst[14][3]), XAIE_DISABLE, XAIE_ENABLE);
  // Reset configuration
  // Program Memory
  for (int i = 0x20000; i <= 0x23FFF; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[14][3]))->TileAddr + i, 0);
  // TileDMA
  for (int i = 0x1D000; i <= 0x1D1F8; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[14][3]))->TileAddr + i, 0);
  for (int i = 0x1DE00; i <= 0x1DE00; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[14][3]))->TileAddr + i, 0);
  for (int i = 0x1DE08; i <= 0x1DE08; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[14][3]))->TileAddr + i, 0);
  for (int i = 0x1DE10; i <= 0x1DE10; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[14][3]))->TileAddr + i, 0);
  for (int i = 0x1DE18; i <= 0x1DE18; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[14][3]))->TileAddr + i, 0);
  // Stream Switch master config
  for (int i = 0x3F000; i <= 0x3F060; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[14][3]))->TileAddr + i, 0);
  // Stream Switch slave config
  for (int i = 0x3F100; i <= 0x3F168; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[14][3]))->TileAddr + i, 0);
  // Stream Switch slave slot config
  for (int i = 0x3F200; i <= 0x3F3AC; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[14][3]))->TileAddr + i, 0);
  for (int l = 0; l < 16; l++)
    XAieTile_LockRelease(&(ctx->TileInst[14][3]), l, 0x0, 0);
  XAieTile_ShimColumnReset(&(ctx->TileInst[15][0]), XAIE_RESETENABLE);
  // Reset configuration
  // Stream Switch master config
  for (int i = 0x3F000; i <= 0x3F058; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[15][0]))->TileAddr + i, 0);
  // Stream Switch slave config
  for (int i = 0x3F100; i <= 0x3F15C; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[15][0]))->TileAddr + i, 0);
  // Stream Switch slave slot config
  for (int i = 0x3F200; i <= 0x3F37C; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[15][0]))->TileAddr + i, 0);
  XAieTile_ShimColumnReset(&(ctx->TileInst[15][0]), XAIE_RESETDISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[15][1]), XAIE_DISABLE, XAIE_ENABLE);
  // Reset configuration
  // Program Memory
  for (int i = 0x20000; i <= 0x23FFF; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[15][1]))->TileAddr + i, 0);
  // TileDMA
  for (int i = 0x1D000; i <= 0x1D1F8; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[15][1]))->TileAddr + i, 0);
  for (int i = 0x1DE00; i <= 0x1DE00; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[15][1]))->TileAddr + i, 0);
  for (int i = 0x1DE08; i <= 0x1DE08; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[15][1]))->TileAddr + i, 0);
  for (int i = 0x1DE10; i <= 0x1DE10; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[15][1]))->TileAddr + i, 0);
  for (int i = 0x1DE18; i <= 0x1DE18; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[15][1]))->TileAddr + i, 0);
  // Stream Switch master config
  for (int i = 0x3F000; i <= 0x3F060; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[15][1]))->TileAddr + i, 0);
  // Stream Switch slave config
  for (int i = 0x3F100; i <= 0x3F168; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[15][1]))->TileAddr + i, 0);
  // Stream Switch slave slot config
  for (int i = 0x3F200; i <= 0x3F3AC; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[15][1]))->TileAddr + i, 0);
  for (int l = 0; l < 16; l++)
    XAieTile_LockRelease(&(ctx->TileInst[15][1]), l, 0x0, 0);
  XAieTile_CoreControl(&(ctx->TileInst[15][2]), XAIE_DISABLE, XAIE_ENABLE);
  // Reset configuration
  // Program Memory
  for (int i = 0x20000; i <= 0x23FFF; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[15][2]))->TileAddr + i, 0);
  // TileDMA
  for (int i = 0x1D000; i <= 0x1D1F8; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[15][2]))->TileAddr + i, 0);
  for (int i = 0x1DE00; i <= 0x1DE00; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[15][2]))->TileAddr + i, 0);
  for (int i = 0x1DE08; i <= 0x1DE08; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[15][2]))->TileAddr + i, 0);
  for (int i = 0x1DE10; i <= 0x1DE10; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[15][2]))->TileAddr + i, 0);
  for (int i = 0x1DE18; i <= 0x1DE18; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[15][2]))->TileAddr + i, 0);
  // Stream Switch master config
  for (int i = 0x3F000; i <= 0x3F060; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[15][2]))->TileAddr + i, 0);
  // Stream Switch slave config
  for (int i = 0x3F100; i <= 0x3F168; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[15][2]))->TileAddr + i, 0);
  // Stream Switch slave slot config
  for (int i = 0x3F200; i <= 0x3F3AC; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[15][2]))->TileAddr + i, 0);
  for (int l = 0; l < 16; l++)
    XAieTile_LockRelease(&(ctx->TileInst[15][2]), l, 0x0, 0);
  XAieTile_CoreControl(&(ctx->TileInst[15][3]), XAIE_DISABLE, XAIE_ENABLE);
  // Reset configuration
  // Program Memory
  for (int i = 0x20000; i <= 0x23FFF; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[15][3]))->TileAddr + i, 0);
  // TileDMA
  for (int i = 0x1D000; i <= 0x1D1F8; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[15][3]))->TileAddr + i, 0);
  for (int i = 0x1DE00; i <= 0x1DE00; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[15][3]))->TileAddr + i, 0);
  for (int i = 0x1DE08; i <= 0x1DE08; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[15][3]))->TileAddr + i, 0);
  for (int i = 0x1DE10; i <= 0x1DE10; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[15][3]))->TileAddr + i, 0);
  for (int i = 0x1DE18; i <= 0x1DE18; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[15][3]))->TileAddr + i, 0);
  // Stream Switch master config
  for (int i = 0x3F000; i <= 0x3F060; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[15][3]))->TileAddr + i, 0);
  // Stream Switch slave config
  for (int i = 0x3F100; i <= 0x3F168; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[15][3]))->TileAddr + i, 0);
  // Stream Switch slave slot config
  for (int i = 0x3F200; i <= 0x3F3AC; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[15][3]))->TileAddr + i, 0);
  for (int l = 0; l < 16; l++)
    XAieTile_LockRelease(&(ctx->TileInst[15][3]), l, 0x0, 0);
  XAieTile_ShimColumnReset(&(ctx->TileInst[16][0]), XAIE_RESETENABLE);
  // Reset configuration
  // Stream Switch master config
  for (int i = 0x3F000; i <= 0x3F058; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[16][0]))->TileAddr + i, 0);
  // Stream Switch slave config
  for (int i = 0x3F100; i <= 0x3F15C; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[16][0]))->TileAddr + i, 0);
  // Stream Switch slave slot config
  for (int i = 0x3F200; i <= 0x3F37C; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[16][0]))->TileAddr + i, 0);
  XAieTile_ShimColumnReset(&(ctx->TileInst[16][0]), XAIE_RESETDISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[16][1]), XAIE_DISABLE, XAIE_ENABLE);
  // Reset configuration
  // Program Memory
  for (int i = 0x20000; i <= 0x23FFF; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[16][1]))->TileAddr + i, 0);
  // TileDMA
  for (int i = 0x1D000; i <= 0x1D1F8; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[16][1]))->TileAddr + i, 0);
  for (int i = 0x1DE00; i <= 0x1DE00; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[16][1]))->TileAddr + i, 0);
  for (int i = 0x1DE08; i <= 0x1DE08; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[16][1]))->TileAddr + i, 0);
  for (int i = 0x1DE10; i <= 0x1DE10; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[16][1]))->TileAddr + i, 0);
  for (int i = 0x1DE18; i <= 0x1DE18; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[16][1]))->TileAddr + i, 0);
  // Stream Switch master config
  for (int i = 0x3F000; i <= 0x3F060; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[16][1]))->TileAddr + i, 0);
  // Stream Switch slave config
  for (int i = 0x3F100; i <= 0x3F168; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[16][1]))->TileAddr + i, 0);
  // Stream Switch slave slot config
  for (int i = 0x3F200; i <= 0x3F3AC; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[16][1]))->TileAddr + i, 0);
  for (int l = 0; l < 16; l++)
    XAieTile_LockRelease(&(ctx->TileInst[16][1]), l, 0x0, 0);
  XAieTile_CoreControl(&(ctx->TileInst[16][2]), XAIE_DISABLE, XAIE_ENABLE);
  // Reset configuration
  // Program Memory
  for (int i = 0x20000; i <= 0x23FFF; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[16][2]))->TileAddr + i, 0);
  // TileDMA
  for (int i = 0x1D000; i <= 0x1D1F8; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[16][2]))->TileAddr + i, 0);
  for (int i = 0x1DE00; i <= 0x1DE00; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[16][2]))->TileAddr + i, 0);
  for (int i = 0x1DE08; i <= 0x1DE08; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[16][2]))->TileAddr + i, 0);
  for (int i = 0x1DE10; i <= 0x1DE10; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[16][2]))->TileAddr + i, 0);
  for (int i = 0x1DE18; i <= 0x1DE18; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[16][2]))->TileAddr + i, 0);
  // Stream Switch master config
  for (int i = 0x3F000; i <= 0x3F060; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[16][2]))->TileAddr + i, 0);
  // Stream Switch slave config
  for (int i = 0x3F100; i <= 0x3F168; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[16][2]))->TileAddr + i, 0);
  // Stream Switch slave slot config
  for (int i = 0x3F200; i <= 0x3F3AC; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[16][2]))->TileAddr + i, 0);
  for (int l = 0; l < 16; l++)
    XAieTile_LockRelease(&(ctx->TileInst[16][2]), l, 0x0, 0);
  XAieTile_CoreControl(&(ctx->TileInst[16][3]), XAIE_DISABLE, XAIE_ENABLE);
  // Reset configuration
  // Program Memory
  for (int i = 0x20000; i <= 0x23FFF; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[16][3]))->TileAddr + i, 0);
  // TileDMA
  for (int i = 0x1D000; i <= 0x1D1F8; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[16][3]))->TileAddr + i, 0);
  for (int i = 0x1DE00; i <= 0x1DE00; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[16][3]))->TileAddr + i, 0);
  for (int i = 0x1DE08; i <= 0x1DE08; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[16][3]))->TileAddr + i, 0);
  for (int i = 0x1DE10; i <= 0x1DE10; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[16][3]))->TileAddr + i, 0);
  for (int i = 0x1DE18; i <= 0x1DE18; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[16][3]))->TileAddr + i, 0);
  // Stream Switch master config
  for (int i = 0x3F000; i <= 0x3F060; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[16][3]))->TileAddr + i, 0);
  // Stream Switch slave config
  for (int i = 0x3F100; i <= 0x3F168; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[16][3]))->TileAddr + i, 0);
  // Stream Switch slave slot config
  for (int i = 0x3F200; i <= 0x3F3AC; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[16][3]))->TileAddr + i, 0);
  for (int l = 0; l < 16; l++)
    XAieTile_LockRelease(&(ctx->TileInst[16][3]), l, 0x0, 0);
  XAieTile_ShimColumnReset(&(ctx->TileInst[17][0]), XAIE_RESETENABLE);
  // Reset configuration
  // Stream Switch master config
  for (int i = 0x3F000; i <= 0x3F058; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[17][0]))->TileAddr + i, 0);
  // Stream Switch slave config
  for (int i = 0x3F100; i <= 0x3F15C; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[17][0]))->TileAddr + i, 0);
  // Stream Switch slave slot config
  for (int i = 0x3F200; i <= 0x3F37C; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[17][0]))->TileAddr + i, 0);
  XAieTile_ShimColumnReset(&(ctx->TileInst[17][0]), XAIE_RESETDISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[17][1]), XAIE_DISABLE, XAIE_ENABLE);
  // Reset configuration
  // Program Memory
  for (int i = 0x20000; i <= 0x23FFF; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[17][1]))->TileAddr + i, 0);
  // TileDMA
  for (int i = 0x1D000; i <= 0x1D1F8; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[17][1]))->TileAddr + i, 0);
  for (int i = 0x1DE00; i <= 0x1DE00; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[17][1]))->TileAddr + i, 0);
  for (int i = 0x1DE08; i <= 0x1DE08; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[17][1]))->TileAddr + i, 0);
  for (int i = 0x1DE10; i <= 0x1DE10; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[17][1]))->TileAddr + i, 0);
  for (int i = 0x1DE18; i <= 0x1DE18; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[17][1]))->TileAddr + i, 0);
  // Stream Switch master config
  for (int i = 0x3F000; i <= 0x3F060; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[17][1]))->TileAddr + i, 0);
  // Stream Switch slave config
  for (int i = 0x3F100; i <= 0x3F168; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[17][1]))->TileAddr + i, 0);
  // Stream Switch slave slot config
  for (int i = 0x3F200; i <= 0x3F3AC; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[17][1]))->TileAddr + i, 0);
  for (int l = 0; l < 16; l++)
    XAieTile_LockRelease(&(ctx->TileInst[17][1]), l, 0x0, 0);
  XAieTile_CoreControl(&(ctx->TileInst[17][2]), XAIE_DISABLE, XAIE_ENABLE);
  // Reset configuration
  // Program Memory
  for (int i = 0x20000; i <= 0x23FFF; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[17][2]))->TileAddr + i, 0);
  // TileDMA
  for (int i = 0x1D000; i <= 0x1D1F8; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[17][2]))->TileAddr + i, 0);
  for (int i = 0x1DE00; i <= 0x1DE00; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[17][2]))->TileAddr + i, 0);
  for (int i = 0x1DE08; i <= 0x1DE08; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[17][2]))->TileAddr + i, 0);
  for (int i = 0x1DE10; i <= 0x1DE10; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[17][2]))->TileAddr + i, 0);
  for (int i = 0x1DE18; i <= 0x1DE18; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[17][2]))->TileAddr + i, 0);
  // Stream Switch master config
  for (int i = 0x3F000; i <= 0x3F060; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[17][2]))->TileAddr + i, 0);
  // Stream Switch slave config
  for (int i = 0x3F100; i <= 0x3F168; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[17][2]))->TileAddr + i, 0);
  // Stream Switch slave slot config
  for (int i = 0x3F200; i <= 0x3F3AC; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[17][2]))->TileAddr + i, 0);
  for (int l = 0; l < 16; l++)
    XAieTile_LockRelease(&(ctx->TileInst[17][2]), l, 0x0, 0);
  XAieTile_CoreControl(&(ctx->TileInst[17][3]), XAIE_DISABLE, XAIE_ENABLE);
  // Reset configuration
  // Program Memory
  for (int i = 0x20000; i <= 0x23FFF; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[17][3]))->TileAddr + i, 0);
  // TileDMA
  for (int i = 0x1D000; i <= 0x1D1F8; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[17][3]))->TileAddr + i, 0);
  for (int i = 0x1DE00; i <= 0x1DE00; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[17][3]))->TileAddr + i, 0);
  for (int i = 0x1DE08; i <= 0x1DE08; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[17][3]))->TileAddr + i, 0);
  for (int i = 0x1DE10; i <= 0x1DE10; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[17][3]))->TileAddr + i, 0);
  for (int i = 0x1DE18; i <= 0x1DE18; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[17][3]))->TileAddr + i, 0);
  // Stream Switch master config
  for (int i = 0x3F000; i <= 0x3F060; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[17][3]))->TileAddr + i, 0);
  // Stream Switch slave config
  for (int i = 0x3F100; i <= 0x3F168; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[17][3]))->TileAddr + i, 0);
  // Stream Switch slave slot config
  for (int i = 0x3F200; i <= 0x3F3AC; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[17][3]))->TileAddr + i, 0);
  for (int l = 0; l < 16; l++)
    XAieTile_LockRelease(&(ctx->TileInst[17][3]), l, 0x0, 0);
  XAieTile_ShimColumnReset(&(ctx->TileInst[18][0]), XAIE_RESETENABLE);
  // Reset configuration
  // Reset configuration
  // ShimDMA
  for (int i = 0x1D000; i <= 0x1D13C; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[18][0]))->TileAddr + i, 0);
  for (int i = 0x1D140; i <= 0x1D140; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[18][0]))->TileAddr + i, 0);
  for (int i = 0x1D148; i <= 0x1D148; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[18][0]))->TileAddr + i, 0);
  for (int i = 0x1D150; i <= 0x1D150; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[18][0]))->TileAddr + i, 0);
  for (int i = 0x1D158; i <= 0x1D158; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[18][0]))->TileAddr + i, 0);
  // Stream Switch master config
  for (int i = 0x3F000; i <= 0x3F058; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[18][0]))->TileAddr + i, 0);
  // Stream Switch slave config
  for (int i = 0x3F100; i <= 0x3F15C; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[18][0]))->TileAddr + i, 0);
  // Stream Switch slave slot config
  for (int i = 0x3F200; i <= 0x3F37C; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[18][0]))->TileAddr + i, 0);
  XAieTile_ShimColumnReset(&(ctx->TileInst[18][0]), XAIE_RESETDISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[18][1]), XAIE_DISABLE, XAIE_ENABLE);
  // Reset configuration
  // Program Memory
  for (int i = 0x20000; i <= 0x23FFF; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[18][1]))->TileAddr + i, 0);
  // TileDMA
  for (int i = 0x1D000; i <= 0x1D1F8; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[18][1]))->TileAddr + i, 0);
  for (int i = 0x1DE00; i <= 0x1DE00; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[18][1]))->TileAddr + i, 0);
  for (int i = 0x1DE08; i <= 0x1DE08; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[18][1]))->TileAddr + i, 0);
  for (int i = 0x1DE10; i <= 0x1DE10; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[18][1]))->TileAddr + i, 0);
  for (int i = 0x1DE18; i <= 0x1DE18; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[18][1]))->TileAddr + i, 0);
  // Stream Switch master config
  for (int i = 0x3F000; i <= 0x3F060; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[18][1]))->TileAddr + i, 0);
  // Stream Switch slave config
  for (int i = 0x3F100; i <= 0x3F168; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[18][1]))->TileAddr + i, 0);
  // Stream Switch slave slot config
  for (int i = 0x3F200; i <= 0x3F3AC; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[18][1]))->TileAddr + i, 0);
  for (int l = 0; l < 16; l++)
    XAieTile_LockRelease(&(ctx->TileInst[18][1]), l, 0x0, 0);
  XAieTile_CoreControl(&(ctx->TileInst[18][2]), XAIE_DISABLE, XAIE_ENABLE);
  // Reset configuration
  // Program Memory
  for (int i = 0x20000; i <= 0x23FFF; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[18][2]))->TileAddr + i, 0);
  // TileDMA
  for (int i = 0x1D000; i <= 0x1D1F8; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[18][2]))->TileAddr + i, 0);
  for (int i = 0x1DE00; i <= 0x1DE00; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[18][2]))->TileAddr + i, 0);
  for (int i = 0x1DE08; i <= 0x1DE08; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[18][2]))->TileAddr + i, 0);
  for (int i = 0x1DE10; i <= 0x1DE10; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[18][2]))->TileAddr + i, 0);
  for (int i = 0x1DE18; i <= 0x1DE18; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[18][2]))->TileAddr + i, 0);
  // Stream Switch master config
  for (int i = 0x3F000; i <= 0x3F060; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[18][2]))->TileAddr + i, 0);
  // Stream Switch slave config
  for (int i = 0x3F100; i <= 0x3F168; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[18][2]))->TileAddr + i, 0);
  // Stream Switch slave slot config
  for (int i = 0x3F200; i <= 0x3F3AC; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[18][2]))->TileAddr + i, 0);
  for (int l = 0; l < 16; l++)
    XAieTile_LockRelease(&(ctx->TileInst[18][2]), l, 0x0, 0);
  XAieTile_CoreControl(&(ctx->TileInst[18][3]), XAIE_DISABLE, XAIE_ENABLE);
  // Reset configuration
  // Program Memory
  for (int i = 0x20000; i <= 0x23FFF; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[18][3]))->TileAddr + i, 0);
  // TileDMA
  for (int i = 0x1D000; i <= 0x1D1F8; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[18][3]))->TileAddr + i, 0);
  for (int i = 0x1DE00; i <= 0x1DE00; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[18][3]))->TileAddr + i, 0);
  for (int i = 0x1DE08; i <= 0x1DE08; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[18][3]))->TileAddr + i, 0);
  for (int i = 0x1DE10; i <= 0x1DE10; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[18][3]))->TileAddr + i, 0);
  for (int i = 0x1DE18; i <= 0x1DE18; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[18][3]))->TileAddr + i, 0);
  // Stream Switch master config
  for (int i = 0x3F000; i <= 0x3F060; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[18][3]))->TileAddr + i, 0);
  // Stream Switch slave config
  for (int i = 0x3F100; i <= 0x3F168; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[18][3]))->TileAddr + i, 0);
  // Stream Switch slave slot config
  for (int i = 0x3F200; i <= 0x3F3AC; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[18][3]))->TileAddr + i, 0);
  for (int l = 0; l < 16; l++)
    XAieTile_LockRelease(&(ctx->TileInst[18][3]), l, 0x0, 0);
  XAieTile_ShimColumnReset(&(ctx->TileInst[19][0]), XAIE_RESETENABLE);
  // Reset configuration
  // Reset configuration
  // ShimDMA
  for (int i = 0x1D000; i <= 0x1D13C; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[19][0]))->TileAddr + i, 0);
  for (int i = 0x1D140; i <= 0x1D140; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[19][0]))->TileAddr + i, 0);
  for (int i = 0x1D148; i <= 0x1D148; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[19][0]))->TileAddr + i, 0);
  for (int i = 0x1D150; i <= 0x1D150; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[19][0]))->TileAddr + i, 0);
  for (int i = 0x1D158; i <= 0x1D158; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[19][0]))->TileAddr + i, 0);
  // Stream Switch master config
  for (int i = 0x3F000; i <= 0x3F058; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[19][0]))->TileAddr + i, 0);
  // Stream Switch slave config
  for (int i = 0x3F100; i <= 0x3F15C; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[19][0]))->TileAddr + i, 0);
  // Stream Switch slave slot config
  for (int i = 0x3F200; i <= 0x3F37C; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[19][0]))->TileAddr + i, 0);
  XAieTile_ShimColumnReset(&(ctx->TileInst[19][0]), XAIE_RESETDISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[19][1]), XAIE_DISABLE, XAIE_ENABLE);
  // Reset configuration
  // Program Memory
  for (int i = 0x20000; i <= 0x23FFF; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[19][1]))->TileAddr + i, 0);
  // TileDMA
  for (int i = 0x1D000; i <= 0x1D1F8; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[19][1]))->TileAddr + i, 0);
  for (int i = 0x1DE00; i <= 0x1DE00; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[19][1]))->TileAddr + i, 0);
  for (int i = 0x1DE08; i <= 0x1DE08; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[19][1]))->TileAddr + i, 0);
  for (int i = 0x1DE10; i <= 0x1DE10; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[19][1]))->TileAddr + i, 0);
  for (int i = 0x1DE18; i <= 0x1DE18; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[19][1]))->TileAddr + i, 0);
  // Stream Switch master config
  for (int i = 0x3F000; i <= 0x3F060; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[19][1]))->TileAddr + i, 0);
  // Stream Switch slave config
  for (int i = 0x3F100; i <= 0x3F168; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[19][1]))->TileAddr + i, 0);
  // Stream Switch slave slot config
  for (int i = 0x3F200; i <= 0x3F3AC; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[19][1]))->TileAddr + i, 0);
  for (int l = 0; l < 16; l++)
    XAieTile_LockRelease(&(ctx->TileInst[19][1]), l, 0x0, 0);
  XAieTile_CoreControl(&(ctx->TileInst[19][2]), XAIE_DISABLE, XAIE_ENABLE);
  // Reset configuration
  // Program Memory
  for (int i = 0x20000; i <= 0x23FFF; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[19][2]))->TileAddr + i, 0);
  // TileDMA
  for (int i = 0x1D000; i <= 0x1D1F8; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[19][2]))->TileAddr + i, 0);
  for (int i = 0x1DE00; i <= 0x1DE00; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[19][2]))->TileAddr + i, 0);
  for (int i = 0x1DE08; i <= 0x1DE08; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[19][2]))->TileAddr + i, 0);
  for (int i = 0x1DE10; i <= 0x1DE10; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[19][2]))->TileAddr + i, 0);
  for (int i = 0x1DE18; i <= 0x1DE18; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[19][2]))->TileAddr + i, 0);
  // Stream Switch master config
  for (int i = 0x3F000; i <= 0x3F060; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[19][2]))->TileAddr + i, 0);
  // Stream Switch slave config
  for (int i = 0x3F100; i <= 0x3F168; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[19][2]))->TileAddr + i, 0);
  // Stream Switch slave slot config
  for (int i = 0x3F200; i <= 0x3F3AC; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[19][2]))->TileAddr + i, 0);
  for (int l = 0; l < 16; l++)
    XAieTile_LockRelease(&(ctx->TileInst[19][2]), l, 0x0, 0);
  XAieTile_CoreControl(&(ctx->TileInst[19][3]), XAIE_DISABLE, XAIE_ENABLE);
  // Reset configuration
  // Program Memory
  for (int i = 0x20000; i <= 0x23FFF; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[19][3]))->TileAddr + i, 0);
  // TileDMA
  for (int i = 0x1D000; i <= 0x1D1F8; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[19][3]))->TileAddr + i, 0);
  for (int i = 0x1DE00; i <= 0x1DE00; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[19][3]))->TileAddr + i, 0);
  for (int i = 0x1DE08; i <= 0x1DE08; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[19][3]))->TileAddr + i, 0);
  for (int i = 0x1DE10; i <= 0x1DE10; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[19][3]))->TileAddr + i, 0);
  for (int i = 0x1DE18; i <= 0x1DE18; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[19][3]))->TileAddr + i, 0);
  // Stream Switch master config
  for (int i = 0x3F000; i <= 0x3F060; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[19][3]))->TileAddr + i, 0);
  // Stream Switch slave config
  for (int i = 0x3F100; i <= 0x3F168; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[19][3]))->TileAddr + i, 0);
  // Stream Switch slave slot config
  for (int i = 0x3F200; i <= 0x3F3AC; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[19][3]))->TileAddr + i, 0);
  for (int l = 0; l < 16; l++)
    XAieTile_LockRelease(&(ctx->TileInst[19][3]), l, 0x0, 0);
  XAieTile_ShimColumnReset(&(ctx->TileInst[20][0]), XAIE_RESETENABLE);
  // Reset configuration
  // Stream Switch master config
  for (int i = 0x3F000; i <= 0x3F058; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[20][0]))->TileAddr + i, 0);
  // Stream Switch slave config
  for (int i = 0x3F100; i <= 0x3F15C; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[20][0]))->TileAddr + i, 0);
  // Stream Switch slave slot config
  for (int i = 0x3F200; i <= 0x3F37C; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[20][0]))->TileAddr + i, 0);
  XAieTile_ShimColumnReset(&(ctx->TileInst[20][0]), XAIE_RESETDISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[20][1]), XAIE_DISABLE, XAIE_ENABLE);
  // Reset configuration
  // Program Memory
  for (int i = 0x20000; i <= 0x23FFF; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[20][1]))->TileAddr + i, 0);
  // TileDMA
  for (int i = 0x1D000; i <= 0x1D1F8; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[20][1]))->TileAddr + i, 0);
  for (int i = 0x1DE00; i <= 0x1DE00; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[20][1]))->TileAddr + i, 0);
  for (int i = 0x1DE08; i <= 0x1DE08; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[20][1]))->TileAddr + i, 0);
  for (int i = 0x1DE10; i <= 0x1DE10; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[20][1]))->TileAddr + i, 0);
  for (int i = 0x1DE18; i <= 0x1DE18; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[20][1]))->TileAddr + i, 0);
  // Stream Switch master config
  for (int i = 0x3F000; i <= 0x3F060; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[20][1]))->TileAddr + i, 0);
  // Stream Switch slave config
  for (int i = 0x3F100; i <= 0x3F168; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[20][1]))->TileAddr + i, 0);
  // Stream Switch slave slot config
  for (int i = 0x3F200; i <= 0x3F3AC; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[20][1]))->TileAddr + i, 0);
  for (int l = 0; l < 16; l++)
    XAieTile_LockRelease(&(ctx->TileInst[20][1]), l, 0x0, 0);
  XAieTile_CoreControl(&(ctx->TileInst[20][2]), XAIE_DISABLE, XAIE_ENABLE);
  // Reset configuration
  // Program Memory
  for (int i = 0x20000; i <= 0x23FFF; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[20][2]))->TileAddr + i, 0);
  // TileDMA
  for (int i = 0x1D000; i <= 0x1D1F8; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[20][2]))->TileAddr + i, 0);
  for (int i = 0x1DE00; i <= 0x1DE00; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[20][2]))->TileAddr + i, 0);
  for (int i = 0x1DE08; i <= 0x1DE08; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[20][2]))->TileAddr + i, 0);
  for (int i = 0x1DE10; i <= 0x1DE10; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[20][2]))->TileAddr + i, 0);
  for (int i = 0x1DE18; i <= 0x1DE18; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[20][2]))->TileAddr + i, 0);
  // Stream Switch master config
  for (int i = 0x3F000; i <= 0x3F060; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[20][2]))->TileAddr + i, 0);
  // Stream Switch slave config
  for (int i = 0x3F100; i <= 0x3F168; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[20][2]))->TileAddr + i, 0);
  // Stream Switch slave slot config
  for (int i = 0x3F200; i <= 0x3F3AC; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[20][2]))->TileAddr + i, 0);
  for (int l = 0; l < 16; l++)
    XAieTile_LockRelease(&(ctx->TileInst[20][2]), l, 0x0, 0);
  XAieTile_CoreControl(&(ctx->TileInst[20][3]), XAIE_DISABLE, XAIE_ENABLE);
  // Reset configuration
  // Program Memory
  for (int i = 0x20000; i <= 0x23FFF; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[20][3]))->TileAddr + i, 0);
  // TileDMA
  for (int i = 0x1D000; i <= 0x1D1F8; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[20][3]))->TileAddr + i, 0);
  for (int i = 0x1DE00; i <= 0x1DE00; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[20][3]))->TileAddr + i, 0);
  for (int i = 0x1DE08; i <= 0x1DE08; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[20][3]))->TileAddr + i, 0);
  for (int i = 0x1DE10; i <= 0x1DE10; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[20][3]))->TileAddr + i, 0);
  for (int i = 0x1DE18; i <= 0x1DE18; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[20][3]))->TileAddr + i, 0);
  // Stream Switch master config
  for (int i = 0x3F000; i <= 0x3F060; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[20][3]))->TileAddr + i, 0);
  // Stream Switch slave config
  for (int i = 0x3F100; i <= 0x3F168; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[20][3]))->TileAddr + i, 0);
  // Stream Switch slave slot config
  for (int i = 0x3F200; i <= 0x3F3AC; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[20][3]))->TileAddr + i, 0);
  for (int l = 0; l < 16; l++)
    XAieTile_LockRelease(&(ctx->TileInst[20][3]), l, 0x0, 0);
  XAieTile_ShimColumnReset(&(ctx->TileInst[21][0]), XAIE_RESETENABLE);
  // Reset configuration
  // Stream Switch master config
  for (int i = 0x3F000; i <= 0x3F058; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[21][0]))->TileAddr + i, 0);
  // Stream Switch slave config
  for (int i = 0x3F100; i <= 0x3F15C; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[21][0]))->TileAddr + i, 0);
  // Stream Switch slave slot config
  for (int i = 0x3F200; i <= 0x3F37C; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[21][0]))->TileAddr + i, 0);
  XAieTile_ShimColumnReset(&(ctx->TileInst[21][0]), XAIE_RESETDISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[21][1]), XAIE_DISABLE, XAIE_ENABLE);
  // Reset configuration
  // Program Memory
  for (int i = 0x20000; i <= 0x23FFF; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[21][1]))->TileAddr + i, 0);
  // TileDMA
  for (int i = 0x1D000; i <= 0x1D1F8; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[21][1]))->TileAddr + i, 0);
  for (int i = 0x1DE00; i <= 0x1DE00; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[21][1]))->TileAddr + i, 0);
  for (int i = 0x1DE08; i <= 0x1DE08; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[21][1]))->TileAddr + i, 0);
  for (int i = 0x1DE10; i <= 0x1DE10; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[21][1]))->TileAddr + i, 0);
  for (int i = 0x1DE18; i <= 0x1DE18; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[21][1]))->TileAddr + i, 0);
  // Stream Switch master config
  for (int i = 0x3F000; i <= 0x3F060; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[21][1]))->TileAddr + i, 0);
  // Stream Switch slave config
  for (int i = 0x3F100; i <= 0x3F168; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[21][1]))->TileAddr + i, 0);
  // Stream Switch slave slot config
  for (int i = 0x3F200; i <= 0x3F3AC; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[21][1]))->TileAddr + i, 0);
  for (int l = 0; l < 16; l++)
    XAieTile_LockRelease(&(ctx->TileInst[21][1]), l, 0x0, 0);
  XAieTile_CoreControl(&(ctx->TileInst[21][2]), XAIE_DISABLE, XAIE_ENABLE);
  // Reset configuration
  // Program Memory
  for (int i = 0x20000; i <= 0x23FFF; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[21][2]))->TileAddr + i, 0);
  // TileDMA
  for (int i = 0x1D000; i <= 0x1D1F8; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[21][2]))->TileAddr + i, 0);
  for (int i = 0x1DE00; i <= 0x1DE00; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[21][2]))->TileAddr + i, 0);
  for (int i = 0x1DE08; i <= 0x1DE08; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[21][2]))->TileAddr + i, 0);
  for (int i = 0x1DE10; i <= 0x1DE10; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[21][2]))->TileAddr + i, 0);
  for (int i = 0x1DE18; i <= 0x1DE18; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[21][2]))->TileAddr + i, 0);
  // Stream Switch master config
  for (int i = 0x3F000; i <= 0x3F060; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[21][2]))->TileAddr + i, 0);
  // Stream Switch slave config
  for (int i = 0x3F100; i <= 0x3F168; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[21][2]))->TileAddr + i, 0);
  // Stream Switch slave slot config
  for (int i = 0x3F200; i <= 0x3F3AC; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[21][2]))->TileAddr + i, 0);
  for (int l = 0; l < 16; l++)
    XAieTile_LockRelease(&(ctx->TileInst[21][2]), l, 0x0, 0);
  XAieTile_CoreControl(&(ctx->TileInst[21][3]), XAIE_DISABLE, XAIE_ENABLE);
  // Reset configuration
  // Program Memory
  for (int i = 0x20000; i <= 0x23FFF; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[21][3]))->TileAddr + i, 0);
  // TileDMA
  for (int i = 0x1D000; i <= 0x1D1F8; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[21][3]))->TileAddr + i, 0);
  for (int i = 0x1DE00; i <= 0x1DE00; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[21][3]))->TileAddr + i, 0);
  for (int i = 0x1DE08; i <= 0x1DE08; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[21][3]))->TileAddr + i, 0);
  for (int i = 0x1DE10; i <= 0x1DE10; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[21][3]))->TileAddr + i, 0);
  for (int i = 0x1DE18; i <= 0x1DE18; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[21][3]))->TileAddr + i, 0);
  // Stream Switch master config
  for (int i = 0x3F000; i <= 0x3F060; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[21][3]))->TileAddr + i, 0);
  // Stream Switch slave config
  for (int i = 0x3F100; i <= 0x3F168; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[21][3]))->TileAddr + i, 0);
  // Stream Switch slave slot config
  for (int i = 0x3F200; i <= 0x3F3AC; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[21][3]))->TileAddr + i, 0);
  for (int l = 0; l < 16; l++)
    XAieTile_LockRelease(&(ctx->TileInst[21][3]), l, 0x0, 0);
  XAieTile_ShimColumnReset(&(ctx->TileInst[22][0]), XAIE_RESETENABLE);
  // Reset configuration
  // Stream Switch master config
  for (int i = 0x3F000; i <= 0x3F058; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[22][0]))->TileAddr + i, 0);
  // Stream Switch slave config
  for (int i = 0x3F100; i <= 0x3F15C; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[22][0]))->TileAddr + i, 0);
  // Stream Switch slave slot config
  for (int i = 0x3F200; i <= 0x3F37C; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[22][0]))->TileAddr + i, 0);
  XAieTile_ShimColumnReset(&(ctx->TileInst[22][0]), XAIE_RESETDISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[22][1]), XAIE_DISABLE, XAIE_ENABLE);
  // Reset configuration
  // Program Memory
  for (int i = 0x20000; i <= 0x23FFF; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[22][1]))->TileAddr + i, 0);
  // TileDMA
  for (int i = 0x1D000; i <= 0x1D1F8; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[22][1]))->TileAddr + i, 0);
  for (int i = 0x1DE00; i <= 0x1DE00; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[22][1]))->TileAddr + i, 0);
  for (int i = 0x1DE08; i <= 0x1DE08; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[22][1]))->TileAddr + i, 0);
  for (int i = 0x1DE10; i <= 0x1DE10; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[22][1]))->TileAddr + i, 0);
  for (int i = 0x1DE18; i <= 0x1DE18; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[22][1]))->TileAddr + i, 0);
  // Stream Switch master config
  for (int i = 0x3F000; i <= 0x3F060; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[22][1]))->TileAddr + i, 0);
  // Stream Switch slave config
  for (int i = 0x3F100; i <= 0x3F168; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[22][1]))->TileAddr + i, 0);
  // Stream Switch slave slot config
  for (int i = 0x3F200; i <= 0x3F3AC; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[22][1]))->TileAddr + i, 0);
  for (int l = 0; l < 16; l++)
    XAieTile_LockRelease(&(ctx->TileInst[22][1]), l, 0x0, 0);
  XAieTile_CoreControl(&(ctx->TileInst[22][2]), XAIE_DISABLE, XAIE_ENABLE);
  // Reset configuration
  // Program Memory
  for (int i = 0x20000; i <= 0x23FFF; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[22][2]))->TileAddr + i, 0);
  // TileDMA
  for (int i = 0x1D000; i <= 0x1D1F8; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[22][2]))->TileAddr + i, 0);
  for (int i = 0x1DE00; i <= 0x1DE00; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[22][2]))->TileAddr + i, 0);
  for (int i = 0x1DE08; i <= 0x1DE08; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[22][2]))->TileAddr + i, 0);
  for (int i = 0x1DE10; i <= 0x1DE10; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[22][2]))->TileAddr + i, 0);
  for (int i = 0x1DE18; i <= 0x1DE18; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[22][2]))->TileAddr + i, 0);
  // Stream Switch master config
  for (int i = 0x3F000; i <= 0x3F060; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[22][2]))->TileAddr + i, 0);
  // Stream Switch slave config
  for (int i = 0x3F100; i <= 0x3F168; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[22][2]))->TileAddr + i, 0);
  // Stream Switch slave slot config
  for (int i = 0x3F200; i <= 0x3F3AC; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[22][2]))->TileAddr + i, 0);
  for (int l = 0; l < 16; l++)
    XAieTile_LockRelease(&(ctx->TileInst[22][2]), l, 0x0, 0);
  XAieTile_CoreControl(&(ctx->TileInst[22][3]), XAIE_DISABLE, XAIE_ENABLE);
  // Reset configuration
  // Program Memory
  for (int i = 0x20000; i <= 0x23FFF; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[22][3]))->TileAddr + i, 0);
  // TileDMA
  for (int i = 0x1D000; i <= 0x1D1F8; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[22][3]))->TileAddr + i, 0);
  for (int i = 0x1DE00; i <= 0x1DE00; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[22][3]))->TileAddr + i, 0);
  for (int i = 0x1DE08; i <= 0x1DE08; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[22][3]))->TileAddr + i, 0);
  for (int i = 0x1DE10; i <= 0x1DE10; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[22][3]))->TileAddr + i, 0);
  for (int i = 0x1DE18; i <= 0x1DE18; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[22][3]))->TileAddr + i, 0);
  // Stream Switch master config
  for (int i = 0x3F000; i <= 0x3F060; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[22][3]))->TileAddr + i, 0);
  // Stream Switch slave config
  for (int i = 0x3F100; i <= 0x3F168; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[22][3]))->TileAddr + i, 0);
  // Stream Switch slave slot config
  for (int i = 0x3F200; i <= 0x3F3AC; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[22][3]))->TileAddr + i, 0);
  for (int l = 0; l < 16; l++)
    XAieTile_LockRelease(&(ctx->TileInst[22][3]), l, 0x0, 0);
  XAieTile_ShimColumnReset(&(ctx->TileInst[23][0]), XAIE_RESETENABLE);
  // Reset configuration
  // Stream Switch master config
  for (int i = 0x3F000; i <= 0x3F058; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[23][0]))->TileAddr + i, 0);
  // Stream Switch slave config
  for (int i = 0x3F100; i <= 0x3F15C; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[23][0]))->TileAddr + i, 0);
  // Stream Switch slave slot config
  for (int i = 0x3F200; i <= 0x3F37C; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[23][0]))->TileAddr + i, 0);
  XAieTile_ShimColumnReset(&(ctx->TileInst[23][0]), XAIE_RESETDISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[23][1]), XAIE_DISABLE, XAIE_ENABLE);
  // Reset configuration
  // Program Memory
  for (int i = 0x20000; i <= 0x23FFF; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[23][1]))->TileAddr + i, 0);
  // TileDMA
  for (int i = 0x1D000; i <= 0x1D1F8; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[23][1]))->TileAddr + i, 0);
  for (int i = 0x1DE00; i <= 0x1DE00; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[23][1]))->TileAddr + i, 0);
  for (int i = 0x1DE08; i <= 0x1DE08; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[23][1]))->TileAddr + i, 0);
  for (int i = 0x1DE10; i <= 0x1DE10; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[23][1]))->TileAddr + i, 0);
  for (int i = 0x1DE18; i <= 0x1DE18; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[23][1]))->TileAddr + i, 0);
  // Stream Switch master config
  for (int i = 0x3F000; i <= 0x3F060; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[23][1]))->TileAddr + i, 0);
  // Stream Switch slave config
  for (int i = 0x3F100; i <= 0x3F168; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[23][1]))->TileAddr + i, 0);
  // Stream Switch slave slot config
  for (int i = 0x3F200; i <= 0x3F3AC; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[23][1]))->TileAddr + i, 0);
  for (int l = 0; l < 16; l++)
    XAieTile_LockRelease(&(ctx->TileInst[23][1]), l, 0x0, 0);
  XAieTile_CoreControl(&(ctx->TileInst[23][2]), XAIE_DISABLE, XAIE_ENABLE);
  // Reset configuration
  // Program Memory
  for (int i = 0x20000; i <= 0x23FFF; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[23][2]))->TileAddr + i, 0);
  // TileDMA
  for (int i = 0x1D000; i <= 0x1D1F8; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[23][2]))->TileAddr + i, 0);
  for (int i = 0x1DE00; i <= 0x1DE00; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[23][2]))->TileAddr + i, 0);
  for (int i = 0x1DE08; i <= 0x1DE08; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[23][2]))->TileAddr + i, 0);
  for (int i = 0x1DE10; i <= 0x1DE10; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[23][2]))->TileAddr + i, 0);
  for (int i = 0x1DE18; i <= 0x1DE18; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[23][2]))->TileAddr + i, 0);
  // Stream Switch master config
  for (int i = 0x3F000; i <= 0x3F060; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[23][2]))->TileAddr + i, 0);
  // Stream Switch slave config
  for (int i = 0x3F100; i <= 0x3F168; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[23][2]))->TileAddr + i, 0);
  // Stream Switch slave slot config
  for (int i = 0x3F200; i <= 0x3F3AC; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[23][2]))->TileAddr + i, 0);
  for (int l = 0; l < 16; l++)
    XAieTile_LockRelease(&(ctx->TileInst[23][2]), l, 0x0, 0);
  XAieTile_CoreControl(&(ctx->TileInst[23][3]), XAIE_DISABLE, XAIE_ENABLE);
  // Reset configuration
  // Program Memory
  for (int i = 0x20000; i <= 0x23FFF; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[23][3]))->TileAddr + i, 0);
  // TileDMA
  for (int i = 0x1D000; i <= 0x1D1F8; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[23][3]))->TileAddr + i, 0);
  for (int i = 0x1DE00; i <= 0x1DE00; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[23][3]))->TileAddr + i, 0);
  for (int i = 0x1DE08; i <= 0x1DE08; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[23][3]))->TileAddr + i, 0);
  for (int i = 0x1DE10; i <= 0x1DE10; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[23][3]))->TileAddr + i, 0);
  for (int i = 0x1DE18; i <= 0x1DE18; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[23][3]))->TileAddr + i, 0);
  // Stream Switch master config
  for (int i = 0x3F000; i <= 0x3F060; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[23][3]))->TileAddr + i, 0);
  // Stream Switch slave config
  for (int i = 0x3F100; i <= 0x3F168; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[23][3]))->TileAddr + i, 0);
  // Stream Switch slave slot config
  for (int i = 0x3F200; i <= 0x3F3AC; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[23][3]))->TileAddr + i, 0);
  for (int l = 0; l < 16; l++)
    XAieTile_LockRelease(&(ctx->TileInst[23][3]), l, 0x0, 0);
  XAieTile_ShimColumnReset(&(ctx->TileInst[24][0]), XAIE_RESETENABLE);
  // Reset configuration
  // Stream Switch master config
  for (int i = 0x3F000; i <= 0x3F058; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[24][0]))->TileAddr + i, 0);
  // Stream Switch slave config
  for (int i = 0x3F100; i <= 0x3F15C; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[24][0]))->TileAddr + i, 0);
  // Stream Switch slave slot config
  for (int i = 0x3F200; i <= 0x3F37C; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[24][0]))->TileAddr + i, 0);
  XAieTile_ShimColumnReset(&(ctx->TileInst[24][0]), XAIE_RESETDISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[24][1]), XAIE_DISABLE, XAIE_ENABLE);
  // Reset configuration
  // Program Memory
  for (int i = 0x20000; i <= 0x23FFF; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[24][1]))->TileAddr + i, 0);
  // TileDMA
  for (int i = 0x1D000; i <= 0x1D1F8; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[24][1]))->TileAddr + i, 0);
  for (int i = 0x1DE00; i <= 0x1DE00; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[24][1]))->TileAddr + i, 0);
  for (int i = 0x1DE08; i <= 0x1DE08; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[24][1]))->TileAddr + i, 0);
  for (int i = 0x1DE10; i <= 0x1DE10; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[24][1]))->TileAddr + i, 0);
  for (int i = 0x1DE18; i <= 0x1DE18; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[24][1]))->TileAddr + i, 0);
  // Stream Switch master config
  for (int i = 0x3F000; i <= 0x3F060; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[24][1]))->TileAddr + i, 0);
  // Stream Switch slave config
  for (int i = 0x3F100; i <= 0x3F168; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[24][1]))->TileAddr + i, 0);
  // Stream Switch slave slot config
  for (int i = 0x3F200; i <= 0x3F3AC; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[24][1]))->TileAddr + i, 0);
  for (int l = 0; l < 16; l++)
    XAieTile_LockRelease(&(ctx->TileInst[24][1]), l, 0x0, 0);
  XAieTile_CoreControl(&(ctx->TileInst[24][2]), XAIE_DISABLE, XAIE_ENABLE);
  // Reset configuration
  // Program Memory
  for (int i = 0x20000; i <= 0x23FFF; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[24][2]))->TileAddr + i, 0);
  // TileDMA
  for (int i = 0x1D000; i <= 0x1D1F8; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[24][2]))->TileAddr + i, 0);
  for (int i = 0x1DE00; i <= 0x1DE00; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[24][2]))->TileAddr + i, 0);
  for (int i = 0x1DE08; i <= 0x1DE08; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[24][2]))->TileAddr + i, 0);
  for (int i = 0x1DE10; i <= 0x1DE10; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[24][2]))->TileAddr + i, 0);
  for (int i = 0x1DE18; i <= 0x1DE18; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[24][2]))->TileAddr + i, 0);
  // Stream Switch master config
  for (int i = 0x3F000; i <= 0x3F060; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[24][2]))->TileAddr + i, 0);
  // Stream Switch slave config
  for (int i = 0x3F100; i <= 0x3F168; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[24][2]))->TileAddr + i, 0);
  // Stream Switch slave slot config
  for (int i = 0x3F200; i <= 0x3F3AC; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[24][2]))->TileAddr + i, 0);
  for (int l = 0; l < 16; l++)
    XAieTile_LockRelease(&(ctx->TileInst[24][2]), l, 0x0, 0);
  XAieTile_CoreControl(&(ctx->TileInst[24][3]), XAIE_DISABLE, XAIE_ENABLE);
  // Reset configuration
  // Program Memory
  for (int i = 0x20000; i <= 0x23FFF; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[24][3]))->TileAddr + i, 0);
  // TileDMA
  for (int i = 0x1D000; i <= 0x1D1F8; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[24][3]))->TileAddr + i, 0);
  for (int i = 0x1DE00; i <= 0x1DE00; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[24][3]))->TileAddr + i, 0);
  for (int i = 0x1DE08; i <= 0x1DE08; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[24][3]))->TileAddr + i, 0);
  for (int i = 0x1DE10; i <= 0x1DE10; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[24][3]))->TileAddr + i, 0);
  for (int i = 0x1DE18; i <= 0x1DE18; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[24][3]))->TileAddr + i, 0);
  // Stream Switch master config
  for (int i = 0x3F000; i <= 0x3F060; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[24][3]))->TileAddr + i, 0);
  // Stream Switch slave config
  for (int i = 0x3F100; i <= 0x3F168; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[24][3]))->TileAddr + i, 0);
  // Stream Switch slave slot config
  for (int i = 0x3F200; i <= 0x3F3AC; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[24][3]))->TileAddr + i, 0);
  for (int l = 0; l < 16; l++)
    XAieTile_LockRelease(&(ctx->TileInst[24][3]), l, 0x0, 0);
  XAieTile_ShimColumnReset(&(ctx->TileInst[25][0]), XAIE_RESETENABLE);
  // Reset configuration
  // Stream Switch master config
  for (int i = 0x3F000; i <= 0x3F058; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[25][0]))->TileAddr + i, 0);
  // Stream Switch slave config
  for (int i = 0x3F100; i <= 0x3F15C; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[25][0]))->TileAddr + i, 0);
  // Stream Switch slave slot config
  for (int i = 0x3F200; i <= 0x3F37C; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[25][0]))->TileAddr + i, 0);
  XAieTile_ShimColumnReset(&(ctx->TileInst[25][0]), XAIE_RESETDISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[25][1]), XAIE_DISABLE, XAIE_ENABLE);
  // Reset configuration
  // Program Memory
  for (int i = 0x20000; i <= 0x23FFF; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[25][1]))->TileAddr + i, 0);
  // TileDMA
  for (int i = 0x1D000; i <= 0x1D1F8; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[25][1]))->TileAddr + i, 0);
  for (int i = 0x1DE00; i <= 0x1DE00; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[25][1]))->TileAddr + i, 0);
  for (int i = 0x1DE08; i <= 0x1DE08; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[25][1]))->TileAddr + i, 0);
  for (int i = 0x1DE10; i <= 0x1DE10; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[25][1]))->TileAddr + i, 0);
  for (int i = 0x1DE18; i <= 0x1DE18; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[25][1]))->TileAddr + i, 0);
  // Stream Switch master config
  for (int i = 0x3F000; i <= 0x3F060; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[25][1]))->TileAddr + i, 0);
  // Stream Switch slave config
  for (int i = 0x3F100; i <= 0x3F168; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[25][1]))->TileAddr + i, 0);
  // Stream Switch slave slot config
  for (int i = 0x3F200; i <= 0x3F3AC; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[25][1]))->TileAddr + i, 0);
  for (int l = 0; l < 16; l++)
    XAieTile_LockRelease(&(ctx->TileInst[25][1]), l, 0x0, 0);
  XAieTile_CoreControl(&(ctx->TileInst[25][2]), XAIE_DISABLE, XAIE_ENABLE);
  // Reset configuration
  // Program Memory
  for (int i = 0x20000; i <= 0x23FFF; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[25][2]))->TileAddr + i, 0);
  // TileDMA
  for (int i = 0x1D000; i <= 0x1D1F8; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[25][2]))->TileAddr + i, 0);
  for (int i = 0x1DE00; i <= 0x1DE00; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[25][2]))->TileAddr + i, 0);
  for (int i = 0x1DE08; i <= 0x1DE08; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[25][2]))->TileAddr + i, 0);
  for (int i = 0x1DE10; i <= 0x1DE10; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[25][2]))->TileAddr + i, 0);
  for (int i = 0x1DE18; i <= 0x1DE18; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[25][2]))->TileAddr + i, 0);
  // Stream Switch master config
  for (int i = 0x3F000; i <= 0x3F060; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[25][2]))->TileAddr + i, 0);
  // Stream Switch slave config
  for (int i = 0x3F100; i <= 0x3F168; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[25][2]))->TileAddr + i, 0);
  // Stream Switch slave slot config
  for (int i = 0x3F200; i <= 0x3F3AC; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[25][2]))->TileAddr + i, 0);
  for (int l = 0; l < 16; l++)
    XAieTile_LockRelease(&(ctx->TileInst[25][2]), l, 0x0, 0);
  XAieTile_CoreControl(&(ctx->TileInst[25][3]), XAIE_DISABLE, XAIE_ENABLE);
  // Reset configuration
  // Program Memory
  for (int i = 0x20000; i <= 0x23FFF; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[25][3]))->TileAddr + i, 0);
  // TileDMA
  for (int i = 0x1D000; i <= 0x1D1F8; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[25][3]))->TileAddr + i, 0);
  for (int i = 0x1DE00; i <= 0x1DE00; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[25][3]))->TileAddr + i, 0);
  for (int i = 0x1DE08; i <= 0x1DE08; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[25][3]))->TileAddr + i, 0);
  for (int i = 0x1DE10; i <= 0x1DE10; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[25][3]))->TileAddr + i, 0);
  for (int i = 0x1DE18; i <= 0x1DE18; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[25][3]))->TileAddr + i, 0);
  // Stream Switch master config
  for (int i = 0x3F000; i <= 0x3F060; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[25][3]))->TileAddr + i, 0);
  // Stream Switch slave config
  for (int i = 0x3F100; i <= 0x3F168; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[25][3]))->TileAddr + i, 0);
  // Stream Switch slave slot config
  for (int i = 0x3F200; i <= 0x3F3AC; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[25][3]))->TileAddr + i, 0);
  for (int l = 0; l < 16; l++)
    XAieTile_LockRelease(&(ctx->TileInst[25][3]), l, 0x0, 0);
} // mlir_aie_configure_cores

void mlir_aie_start_cores(aie_libxaie_ctx_t *ctx) {
  XAieTile_CoreControl(&(ctx->TileInst[26][2]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[26][3]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[26][1]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[0][1]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[0][2]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[0][3]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[1][1]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[1][2]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[1][3]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[2][1]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[2][2]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[2][3]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[3][1]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[3][2]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[3][3]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[4][1]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[4][2]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[4][3]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[5][1]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[5][2]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[5][3]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[6][1]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[6][2]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[6][3]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[7][1]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[7][2]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[7][3]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[8][1]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[8][2]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[8][3]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[9][1]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[9][2]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[9][3]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[10][1]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[10][2]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[10][3]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[11][1]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[11][2]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[11][3]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[12][1]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[12][2]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[12][3]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[13][1]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[13][2]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[13][3]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[14][1]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[14][2]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[14][3]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[15][1]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[15][2]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[15][3]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[16][1]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[16][2]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[16][3]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[17][1]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[17][2]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[17][3]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[18][1]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[18][2]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[18][3]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[19][1]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[19][2]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[19][3]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[20][1]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[20][2]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[20][3]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[21][1]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[21][2]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[21][3]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[22][1]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[22][2]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[22][3]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[23][1]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[23][2]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[23][3]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[24][1]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[24][2]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[24][3]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[25][1]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[25][2]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[25][3]), XAIE_ENABLE, XAIE_DISABLE);
} // mlir_aie_start_cores

void mlir_aie_configure_dmas(aie_libxaie_ctx_t *ctx) {
  XAieDma_TileInitialize(&(ctx->TileInst[26][2]), &(ctx->TileDMAInst[26][2]));
  XAieDma_TileBdClearAll(&(ctx->TileDMAInst[26][2]));
  XAieDma_TileChResetAll(&(ctx->TileDMAInst[26][2]));
  XAieDma_TileBdSetLock(&(ctx->TileDMAInst[26][2]), /* bd */ 0,
                        XAIEDMA_TILE_BD_ADDRA, /* lockID */ 0, XAIE_ENABLE,
                        /* release */ 1, XAIE_ENABLE, /* acquire */ 0);
  XAieDma_TileBdSetAdrLenMod(&(ctx->TileDMAInst[26][2]), /* bd */ 0,
                             /* addrA */ 0x3000, /* addrB */ 0x0,
                             /* len */ 1024 * 4, /* ABMode */ XAIE_DISABLE,
                             /* FIFOMode */ XAIE_DISABLE);
  XAieDma_TileBdSetNext(&(ctx->TileDMAInst[26][2]), /* bd */ 0, /* nextbd */ 0);
  XAieDma_TileBdSetPkt(&(ctx->TileDMAInst[26][2]), /* bd */ 0, /* en */ 1,
                       /* type */ 0, /* id */ 4);
  XAieDma_TileBdWrite(&(ctx->TileDMAInst[26][2]), /* bd */ 0);
  XAieDma_TileBdSetLock(&(ctx->TileDMAInst[26][2]), /* bd */ 1,
                        XAIEDMA_TILE_BD_ADDRA, /* lockID */ 1, XAIE_ENABLE,
                        /* release */ 1, XAIE_ENABLE, /* acquire */ 0);
  XAieDma_TileBdSetAdrLenMod(&(ctx->TileDMAInst[26][2]), /* bd */ 1,
                             /* addrA */ 0x2000, /* addrB */ 0x0,
                             /* len */ 1024 * 4, /* ABMode */ XAIE_DISABLE,
                             /* FIFOMode */ XAIE_DISABLE);
  XAieDma_TileBdSetNext(&(ctx->TileDMAInst[26][2]), /* bd */ 1, /* nextbd */ 1);
  XAieDma_TileBdSetPkt(&(ctx->TileDMAInst[26][2]), /* bd */ 1, /* en */ 1,
                       /* type */ 0, /* id */ 0);
  XAieDma_TileBdWrite(&(ctx->TileDMAInst[26][2]), /* bd */ 1);
  XAieDma_TileSetStartBd((&(ctx->TileDMAInst[26][2])), XAIEDMA_TILE_CHNUM_S2MM0,
                         /* bd */ 0);
  XAieDma_TileChControl(&(ctx->TileDMAInst[26][2]), XAIEDMA_TILE_CHNUM_S2MM0,
                        XAIE_RESETDISABLE, XAIE_ENABLE);
  XAieDma_TileSetStartBd((&(ctx->TileDMAInst[26][2])), XAIEDMA_TILE_CHNUM_S2MM1,
                         /* bd */ 1);
  XAieDma_TileChControl(&(ctx->TileDMAInst[26][2]), XAIEDMA_TILE_CHNUM_S2MM1,
                        XAIE_RESETDISABLE, XAIE_ENABLE);
  XAieDma_TileInitialize(&(ctx->TileInst[26][3]), &(ctx->TileDMAInst[26][3]));
  XAieDma_TileBdClearAll(&(ctx->TileDMAInst[26][3]));
  XAieDma_TileChResetAll(&(ctx->TileDMAInst[26][3]));
  XAieDma_TileBdSetLock(&(ctx->TileDMAInst[26][3]), /* bd */ 0,
                        XAIEDMA_TILE_BD_ADDRA, /* lockID */ 0, XAIE_ENABLE,
                        /* release */ 1, XAIE_ENABLE, /* acquire */ 0);
  XAieDma_TileBdSetAdrLenMod(&(ctx->TileDMAInst[26][3]), /* bd */ 0,
                             /* addrA */ 0x3000, /* addrB */ 0x0,
                             /* len */ 1024 * 4, /* ABMode */ XAIE_DISABLE,
                             /* FIFOMode */ XAIE_DISABLE);
  XAieDma_TileBdSetNext(&(ctx->TileDMAInst[26][3]), /* bd */ 0, /* nextbd */ 0);
  XAieDma_TileBdSetPkt(&(ctx->TileDMAInst[26][3]), /* bd */ 0, /* en */ 1,
                       /* type */ 0, /* id */ 5);
  XAieDma_TileBdWrite(&(ctx->TileDMAInst[26][3]), /* bd */ 0);
  XAieDma_TileBdSetLock(&(ctx->TileDMAInst[26][3]), /* bd */ 1,
                        XAIEDMA_TILE_BD_ADDRA, /* lockID */ 1, XAIE_ENABLE,
                        /* release */ 1, XAIE_ENABLE, /* acquire */ 0);
  XAieDma_TileBdSetAdrLenMod(&(ctx->TileDMAInst[26][3]), /* bd */ 1,
                             /* addrA */ 0x2000, /* addrB */ 0x0,
                             /* len */ 1024 * 4, /* ABMode */ XAIE_DISABLE,
                             /* FIFOMode */ XAIE_DISABLE);
  XAieDma_TileBdSetNext(&(ctx->TileDMAInst[26][3]), /* bd */ 1, /* nextbd */ 1);
  XAieDma_TileBdSetPkt(&(ctx->TileDMAInst[26][3]), /* bd */ 1, /* en */ 1,
                       /* type */ 0, /* id */ 1);
  XAieDma_TileBdWrite(&(ctx->TileDMAInst[26][3]), /* bd */ 1);
  XAieDma_TileBdSetLock(&(ctx->TileDMAInst[26][3]), /* bd */ 2,
                        XAIEDMA_TILE_BD_ADDRA, /* lockID */ 3, XAIE_ENABLE,
                        /* release */ 0, XAIE_ENABLE, /* acquire */ 1);
  XAieDma_TileBdSetAdrLenMod(&(ctx->TileDMAInst[26][3]), /* bd */ 2,
                             /* addrA */ 0x1000, /* addrB */ 0x0,
                             /* len */ 1024 * 4, /* ABMode */ XAIE_DISABLE,
                             /* FIFOMode */ XAIE_DISABLE);
  XAieDma_TileBdSetNext(&(ctx->TileDMAInst[26][3]), /* bd */ 2, /* nextbd */ 2);
  XAieDma_TileBdSetPkt(&(ctx->TileDMAInst[26][3]), /* bd */ 2, /* en */ 1,
                       /* type */ 0, /* id */ 0);
  XAieDma_TileBdWrite(&(ctx->TileDMAInst[26][3]), /* bd */ 2);
  XAieDma_TileSetStartBd((&(ctx->TileDMAInst[26][3])), XAIEDMA_TILE_CHNUM_S2MM0,
                         /* bd */ 0);
  XAieDma_TileChControl(&(ctx->TileDMAInst[26][3]), XAIEDMA_TILE_CHNUM_S2MM0,
                        XAIE_RESETDISABLE, XAIE_ENABLE);
  XAieDma_TileSetStartBd((&(ctx->TileDMAInst[26][3])), XAIEDMA_TILE_CHNUM_S2MM1,
                         /* bd */ 1);
  XAieDma_TileChControl(&(ctx->TileDMAInst[26][3]), XAIEDMA_TILE_CHNUM_S2MM1,
                        XAIE_RESETDISABLE, XAIE_ENABLE);
  XAieDma_TileSetStartBd((&(ctx->TileDMAInst[26][3])), XAIEDMA_TILE_CHNUM_MM2S0,
                         /* bd */ 2);
  XAieDma_TileChControl(&(ctx->TileDMAInst[26][3]), XAIEDMA_TILE_CHNUM_MM2S0,
                        XAIE_RESETDISABLE, XAIE_ENABLE);
  XAieDma_Shim ShimDMAInst_26_0;
  XAieDma_ShimInitialize(&(ctx->TileInst[26][0]), &ShimDMAInst_26_0);
  XAieDma_ShimBdClearAll(&ShimDMAInst_26_0);
  XAieDma_ShimChResetAll(&ShimDMAInst_26_0);
  XAieDma_ShimBdSetAddr(&ShimDMAInst_26_0, /* bd */ 0, HIGH_ADDR((u64)0x8000),
                        LOW_ADDR((u64)0x8000), /* len */ 1025 * 4);
  XAieDma_ShimBdSetAxi(&ShimDMAInst_26_0, /* bd */ 0, /* smid */ 0,
                       /* burstlen */ 4, /* QOS */ 0, /* Cache */ 0,
                       /* secure */ XAIE_ENABLE);
  XAieDma_ShimBdSetNext(&ShimDMAInst_26_0, /* bd */ 0, /* nextbd */ 0);
  XAieDma_ShimBdSetPkt(&ShimDMAInst_26_0, /* bd */ 0, /* en */ 1, /* type */ 0,
                       /* id */ 0);
  XAieDma_ShimBdWrite(&ShimDMAInst_26_0, /* bd */ 0);
  XAieDma_ShimBdSetLock(&ShimDMAInst_26_0, /* bd */ 1, /* lockID */ 3,
                        XAIE_ENABLE, /* release */ 0, XAIE_ENABLE,
                        /* acquire */ 1);
  XAieDma_ShimBdSetAddr(&ShimDMAInst_26_0, /* bd */ 1, HIGH_ADDR((u64)0x6000),
                        LOW_ADDR((u64)0x6000), /* len */ 1024 * 4);
  XAieDma_ShimBdSetAxi(&ShimDMAInst_26_0, /* bd */ 1, /* smid */ 0,
                       /* burstlen */ 4, /* QOS */ 0, /* Cache */ 0,
                       /* secure */ XAIE_ENABLE);
  XAieDma_ShimBdSetNext(&ShimDMAInst_26_0, /* bd */ 1, /* nextbd */ 2);
  XAieDma_ShimBdSetPkt(&ShimDMAInst_26_0, /* bd */ 1, /* en */ 1, /* type */ 0,
                       /* id */ 0);
  XAieDma_ShimBdWrite(&ShimDMAInst_26_0, /* bd */ 1);
  XAieDma_ShimBdSetLock(&ShimDMAInst_26_0, /* bd */ 2, /* lockID */ 1,
                        XAIE_ENABLE, /* release */ 0, XAIE_ENABLE,
                        /* acquire */ 1);
  XAieDma_ShimBdSetAddr(&ShimDMAInst_26_0, /* bd */ 2, HIGH_ADDR((u64)0x4000),
                        LOW_ADDR((u64)0x4000), /* len */ 1024 * 4);
  XAieDma_ShimBdSetAxi(&ShimDMAInst_26_0, /* bd */ 2, /* smid */ 0,
                       /* burstlen */ 4, /* QOS */ 0, /* Cache */ 0,
                       /* secure */ XAIE_ENABLE);
  XAieDma_ShimBdSetNext(&ShimDMAInst_26_0, /* bd */ 2, /* nextbd */ 1);
  XAieDma_ShimBdSetPkt(&ShimDMAInst_26_0, /* bd */ 2, /* en */ 1, /* type */ 0,
                       /* id */ 1);
  XAieDma_ShimBdWrite(&ShimDMAInst_26_0, /* bd */ 2);
  XAieDma_ShimBdSetLock(&ShimDMAInst_26_0, /* bd */ 3, /* lockID */ 2,
                        XAIE_ENABLE, /* release */ 0, XAIE_ENABLE,
                        /* acquire */ 1);
  XAieDma_ShimBdSetAddr(&ShimDMAInst_26_0, /* bd */ 3, HIGH_ADDR((u64)0x7000),
                        LOW_ADDR((u64)0x7000), /* len */ 1024 * 4);
  XAieDma_ShimBdSetAxi(&ShimDMAInst_26_0, /* bd */ 3, /* smid */ 0,
                       /* burstlen */ 4, /* QOS */ 0, /* Cache */ 0,
                       /* secure */ XAIE_ENABLE);
  XAieDma_ShimBdSetNext(&ShimDMAInst_26_0, /* bd */ 3, /* nextbd */ 4);
  XAieDma_ShimBdSetPkt(&ShimDMAInst_26_0, /* bd */ 3, /* en */ 1, /* type */ 0,
                       /* id */ 4);
  XAieDma_ShimBdWrite(&ShimDMAInst_26_0, /* bd */ 3);
  XAieDma_ShimBdSetLock(&ShimDMAInst_26_0, /* bd */ 4, /* lockID */ 0,
                        XAIE_ENABLE, /* release */ 0, XAIE_ENABLE,
                        /* acquire */ 1);
  XAieDma_ShimBdSetAddr(&ShimDMAInst_26_0, /* bd */ 4, HIGH_ADDR((u64)0x5000),
                        LOW_ADDR((u64)0x5000), /* len */ 1024 * 4);
  XAieDma_ShimBdSetAxi(&ShimDMAInst_26_0, /* bd */ 4, /* smid */ 0,
                       /* burstlen */ 4, /* QOS */ 0, /* Cache */ 0,
                       /* secure */ XAIE_ENABLE);
  XAieDma_ShimBdSetNext(&ShimDMAInst_26_0, /* bd */ 4, /* nextbd */ 3);
  XAieDma_ShimBdSetPkt(&ShimDMAInst_26_0, /* bd */ 4, /* en */ 1, /* type */ 0,
                       /* id */ 5);
  XAieDma_ShimBdWrite(&ShimDMAInst_26_0, /* bd */ 4);
  XAieDma_ShimSetStartBd(&ShimDMAInst_26_0, XAIEDMA_SHIM_CHNUM_S2MM0,
                         /* bd */ 0);
  XAieDma_ShimChControl(&ShimDMAInst_26_0, XAIEDMA_TILE_CHNUM_S2MM0,
                        /* PauseStream */ XAIE_DISABLE,
                        /* PauseMM */ XAIE_DISABLE, /* Enable */ XAIE_ENABLE);
  XAieDma_ShimSetStartBd(&ShimDMAInst_26_0, XAIEDMA_SHIM_CHNUM_MM2S0,
                         /* bd */ 1);
  XAieDma_ShimChControl(&ShimDMAInst_26_0, XAIEDMA_TILE_CHNUM_MM2S0,
                        /* PauseStream */ XAIE_DISABLE,
                        /* PauseMM */ XAIE_DISABLE, /* Enable */ XAIE_ENABLE);
  XAieDma_ShimSetStartBd(&ShimDMAInst_26_0, XAIEDMA_SHIM_CHNUM_MM2S1,
                         /* bd */ 3);
  XAieDma_ShimChControl(&ShimDMAInst_26_0, XAIEDMA_TILE_CHNUM_MM2S1,
                        /* PauseStream */ XAIE_DISABLE,
                        /* PauseMM */ XAIE_DISABLE, /* Enable */ XAIE_ENABLE);
} // mlir_aie_configure_dmas

void mlir_aie_initialize_locks(aie_libxaie_ctx_t *ctx) {
} // mlir_aie_initialize_locks
void mlir_aie_configure_switchboxes(aie_libxaie_ctx_t *ctx) {
  int x, y;
  // Core Stream Switch column 26 row 0
  x = 26;
  y = 0;
  XAieTile_StrmConfigMstr(
      &(ctx->TileInst[x][y]),
      XAIETILE_STRSW_MPORT_SOUTH(&(ctx->TileInst[x][y]), 2), XAIE_ENABLE,
      XAIE_ENABLE,
      XAIETILE_STRSW_MPORT_CFGPKT(
          &(ctx->TileInst[x][y]),
          XAIETILE_STRSW_MPORT_SOUTH(&(ctx->TileInst[x][y]), 2),
          XAIE_DISABLE /*drop_header*/, 0x2 /*mask*/, 0 /*arbiter*/));
  XAieTile_StrmConfigMstr(
      &(ctx->TileInst[x][y]),
      XAIETILE_STRSW_MPORT_NORTH(&(ctx->TileInst[x][y]), 0), XAIE_ENABLE,
      XAIE_ENABLE,
      XAIETILE_STRSW_MPORT_CFGPKT(
          &(ctx->TileInst[x][y]),
          XAIETILE_STRSW_MPORT_NORTH(&(ctx->TileInst[x][y]), 0),
          XAIE_DISABLE /*drop_header*/, 0x1 /*mask*/, 0 /*arbiter*/));
  XAieTile_StrmConfigSlv(&(ctx->TileInst[x][y]),
                         XAIETILE_STRSW_SPORT_NORTH(&(ctx->TileInst[x][y]), 0),
                         XAIE_ENABLE, XAIE_ENABLE);
  XAieTile_StrmConfigSlvSlot(
      &(ctx->TileInst[x][y]),
      XAIETILE_STRSW_SPORT_NORTH(&(ctx->TileInst[x][y]), 0), 0 /*slot*/,
      XAIE_ENABLE,
      XAIETILE_STRSW_SLVSLOT_CFG(
          &(ctx->TileInst[x][y]),
          (XAIETILE_STRSW_SPORT_NORTH(&(ctx->TileInst[x][y]), 0)), 0 /*slot*/,
          0x0 /*ID value*/, 0x1F /*mask*/, XAIE_ENABLE, 1 /*msel*/,
          0 /*arbiter*/));
  XAieTile_StrmConfigSlv(&(ctx->TileInst[x][y]),
                         XAIETILE_STRSW_SPORT_SOUTH(&(ctx->TileInst[x][y]), 7),
                         XAIE_ENABLE, XAIE_ENABLE);
  XAieTile_StrmConfigSlvSlot(
      &(ctx->TileInst[x][y]),
      XAIETILE_STRSW_SPORT_SOUTH(&(ctx->TileInst[x][y]), 7), 0 /*slot*/,
      XAIE_ENABLE,
      XAIETILE_STRSW_SLVSLOT_CFG(
          &(ctx->TileInst[x][y]),
          (XAIETILE_STRSW_SPORT_SOUTH(&(ctx->TileInst[x][y]), 7)), 0 /*slot*/,
          0x4 /*ID value*/, 0x1E /*mask*/, XAIE_ENABLE, 0 /*msel*/,
          0 /*arbiter*/));
  XAieTile_StrmConfigSlv(&(ctx->TileInst[x][y]),
                         XAIETILE_STRSW_SPORT_SOUTH(&(ctx->TileInst[x][y]), 3),
                         XAIE_ENABLE, XAIE_ENABLE);
  XAieTile_StrmConfigSlvSlot(
      &(ctx->TileInst[x][y]),
      XAIETILE_STRSW_SPORT_SOUTH(&(ctx->TileInst[x][y]), 3), 0 /*slot*/,
      XAIE_ENABLE,
      XAIETILE_STRSW_SLVSLOT_CFG(
          &(ctx->TileInst[x][y]),
          (XAIETILE_STRSW_SPORT_SOUTH(&(ctx->TileInst[x][y]), 3)), 0 /*slot*/,
          0x0 /*ID value*/, 0x1E /*mask*/, XAIE_ENABLE, 0 /*msel*/,
          0 /*arbiter*/));
  // Core Stream Switch column 26 row 2
  x = 26;
  y = 2;
  XAieTile_StrmConfigMstr(
      &(ctx->TileInst[x][y]),
      XAIETILE_STRSW_MPORT_DMA(&(ctx->TileInst[x][y]), 0), XAIE_ENABLE,
      XAIE_ENABLE,
      XAIETILE_STRSW_MPORT_CFGPKT(
          &(ctx->TileInst[x][y]),
          XAIETILE_STRSW_MPORT_DMA(&(ctx->TileInst[x][y]), 0),
          XAIE_ENABLE /*drop_header*/, 0x4 /*mask*/, 0 /*arbiter*/));
  XAieTile_StrmConfigMstr(
      &(ctx->TileInst[x][y]),
      XAIETILE_STRSW_MPORT_DMA(&(ctx->TileInst[x][y]), 1), XAIE_ENABLE,
      XAIE_ENABLE,
      XAIETILE_STRSW_MPORT_CFGPKT(
          &(ctx->TileInst[x][y]),
          XAIETILE_STRSW_MPORT_DMA(&(ctx->TileInst[x][y]), 1),
          XAIE_ENABLE /*drop_header*/, 0x8 /*mask*/, 0 /*arbiter*/));
  XAieTile_StrmConfigMstr(
      &(ctx->TileInst[x][y]),
      XAIETILE_STRSW_MPORT_SOUTH(&(ctx->TileInst[x][y]), 0), XAIE_ENABLE,
      XAIE_ENABLE,
      XAIETILE_STRSW_MPORT_CFGPKT(
          &(ctx->TileInst[x][y]),
          XAIETILE_STRSW_MPORT_SOUTH(&(ctx->TileInst[x][y]), 0),
          XAIE_DISABLE /*drop_header*/, 0x2 /*mask*/, 0 /*arbiter*/));
  XAieTile_StrmConfigMstr(
      &(ctx->TileInst[x][y]),
      XAIETILE_STRSW_MPORT_NORTH(&(ctx->TileInst[x][y]), 0), XAIE_ENABLE,
      XAIE_ENABLE,
      XAIETILE_STRSW_MPORT_CFGPKT(
          &(ctx->TileInst[x][y]),
          XAIETILE_STRSW_MPORT_NORTH(&(ctx->TileInst[x][y]), 0),
          XAIE_DISABLE /*drop_header*/, 0x1 /*mask*/, 0 /*arbiter*/));
  XAieTile_StrmConfigSlv(&(ctx->TileInst[x][y]),
                         XAIETILE_STRSW_SPORT_NORTH(&(ctx->TileInst[x][y]), 0),
                         XAIE_ENABLE, XAIE_ENABLE);
  XAieTile_StrmConfigSlvSlot(
      &(ctx->TileInst[x][y]),
      XAIETILE_STRSW_SPORT_NORTH(&(ctx->TileInst[x][y]), 0), 0 /*slot*/,
      XAIE_ENABLE,
      XAIETILE_STRSW_SLVSLOT_CFG(
          &(ctx->TileInst[x][y]),
          (XAIETILE_STRSW_SPORT_NORTH(&(ctx->TileInst[x][y]), 0)), 0 /*slot*/,
          0x0 /*ID value*/, 0x1F /*mask*/, XAIE_ENABLE, 1 /*msel*/,
          0 /*arbiter*/));
  XAieTile_StrmConfigSlv(&(ctx->TileInst[x][y]),
                         XAIETILE_STRSW_SPORT_SOUTH(&(ctx->TileInst[x][y]), 0),
                         XAIE_ENABLE, XAIE_ENABLE);
  XAieTile_StrmConfigSlvSlot(
      &(ctx->TileInst[x][y]),
      XAIETILE_STRSW_SPORT_SOUTH(&(ctx->TileInst[x][y]), 0), 0 /*slot*/,
      XAIE_ENABLE,
      XAIETILE_STRSW_SLVSLOT_CFG(
          &(ctx->TileInst[x][y]),
          (XAIETILE_STRSW_SPORT_SOUTH(&(ctx->TileInst[x][y]), 0)), 0 /*slot*/,
          0x4 /*ID value*/, 0x1F /*mask*/, XAIE_ENABLE, 2 /*msel*/,
          0 /*arbiter*/));
  XAieTile_StrmConfigSlv(&(ctx->TileInst[x][y]),
                         XAIETILE_STRSW_SPORT_SOUTH(&(ctx->TileInst[x][y]), 0),
                         XAIE_ENABLE, XAIE_ENABLE);
  XAieTile_StrmConfigSlvSlot(
      &(ctx->TileInst[x][y]),
      XAIETILE_STRSW_SPORT_SOUTH(&(ctx->TileInst[x][y]), 0), 1 /*slot*/,
      XAIE_ENABLE,
      XAIETILE_STRSW_SLVSLOT_CFG(
          &(ctx->TileInst[x][y]),
          (XAIETILE_STRSW_SPORT_SOUTH(&(ctx->TileInst[x][y]), 0)), 1 /*slot*/,
          0x1 /*ID value*/, 0x1B /*mask*/, XAIE_ENABLE, 0 /*msel*/,
          0 /*arbiter*/));
  XAieTile_StrmConfigSlv(&(ctx->TileInst[x][y]),
                         XAIETILE_STRSW_SPORT_SOUTH(&(ctx->TileInst[x][y]), 0),
                         XAIE_ENABLE, XAIE_ENABLE);
  XAieTile_StrmConfigSlvSlot(
      &(ctx->TileInst[x][y]),
      XAIETILE_STRSW_SPORT_SOUTH(&(ctx->TileInst[x][y]), 0), 2 /*slot*/,
      XAIE_ENABLE,
      XAIETILE_STRSW_SLVSLOT_CFG(
          &(ctx->TileInst[x][y]),
          (XAIETILE_STRSW_SPORT_SOUTH(&(ctx->TileInst[x][y]), 0)), 2 /*slot*/,
          0x0 /*ID value*/, 0x1F /*mask*/, XAIE_ENABLE, 3 /*msel*/,
          0 /*arbiter*/));
  // Core Stream Switch column 26 row 3
  x = 26;
  y = 3;
  XAieTile_StrmConfigMstr(
      &(ctx->TileInst[x][y]),
      XAIETILE_STRSW_MPORT_DMA(&(ctx->TileInst[x][y]), 0), XAIE_ENABLE,
      XAIE_ENABLE,
      XAIETILE_STRSW_MPORT_CFGPKT(
          &(ctx->TileInst[x][y]),
          XAIETILE_STRSW_MPORT_DMA(&(ctx->TileInst[x][y]), 0),
          XAIE_ENABLE /*drop_header*/, 0x4 /*mask*/, 0 /*arbiter*/));
  XAieTile_StrmConfigMstr(
      &(ctx->TileInst[x][y]),
      XAIETILE_STRSW_MPORT_DMA(&(ctx->TileInst[x][y]), 1), XAIE_ENABLE,
      XAIE_ENABLE,
      XAIETILE_STRSW_MPORT_CFGPKT(
          &(ctx->TileInst[x][y]),
          XAIETILE_STRSW_MPORT_DMA(&(ctx->TileInst[x][y]), 1),
          XAIE_ENABLE /*drop_header*/, 0x1 /*mask*/, 0 /*arbiter*/));
  XAieTile_StrmConfigMstr(
      &(ctx->TileInst[x][y]),
      XAIETILE_STRSW_MPORT_SOUTH(&(ctx->TileInst[x][y]), 0), XAIE_ENABLE,
      XAIE_ENABLE,
      XAIETILE_STRSW_MPORT_CFGPKT(
          &(ctx->TileInst[x][y]),
          XAIETILE_STRSW_MPORT_SOUTH(&(ctx->TileInst[x][y]), 0),
          XAIE_DISABLE /*drop_header*/, 0x2 /*mask*/, 0 /*arbiter*/));
  XAieTile_StrmConfigSlv(&(ctx->TileInst[x][y]),
                         XAIETILE_STRSW_SPORT_DMA(&(ctx->TileInst[x][y]), 0),
                         XAIE_ENABLE, XAIE_ENABLE);
  XAieTile_StrmConfigSlvSlot(
      &(ctx->TileInst[x][y]),
      XAIETILE_STRSW_SPORT_DMA(&(ctx->TileInst[x][y]), 0), 0 /*slot*/,
      XAIE_ENABLE,
      XAIETILE_STRSW_SLVSLOT_CFG(
          &(ctx->TileInst[x][y]),
          (XAIETILE_STRSW_SPORT_DMA(&(ctx->TileInst[x][y]), 0)), 0 /*slot*/,
          0x0 /*ID value*/, 0x1F /*mask*/, XAIE_ENABLE, 1 /*msel*/,
          0 /*arbiter*/));
  XAieTile_StrmConfigSlv(&(ctx->TileInst[x][y]),
                         XAIETILE_STRSW_SPORT_SOUTH(&(ctx->TileInst[x][y]), 0),
                         XAIE_ENABLE, XAIE_ENABLE);
  XAieTile_StrmConfigSlvSlot(
      &(ctx->TileInst[x][y]),
      XAIETILE_STRSW_SPORT_SOUTH(&(ctx->TileInst[x][y]), 0), 0 /*slot*/,
      XAIE_ENABLE,
      XAIETILE_STRSW_SLVSLOT_CFG(
          &(ctx->TileInst[x][y]),
          (XAIETILE_STRSW_SPORT_SOUTH(&(ctx->TileInst[x][y]), 0)), 0 /*slot*/,
          0x5 /*ID value*/, 0x1F /*mask*/, XAIE_ENABLE, 2 /*msel*/,
          0 /*arbiter*/));
  XAieTile_StrmConfigSlv(&(ctx->TileInst[x][y]),
                         XAIETILE_STRSW_SPORT_SOUTH(&(ctx->TileInst[x][y]), 0),
                         XAIE_ENABLE, XAIE_ENABLE);
  XAieTile_StrmConfigSlvSlot(
      &(ctx->TileInst[x][y]),
      XAIETILE_STRSW_SPORT_SOUTH(&(ctx->TileInst[x][y]), 0), 1 /*slot*/,
      XAIE_ENABLE,
      XAIETILE_STRSW_SLVSLOT_CFG(
          &(ctx->TileInst[x][y]),
          (XAIETILE_STRSW_SPORT_SOUTH(&(ctx->TileInst[x][y]), 0)), 1 /*slot*/,
          0x1 /*ID value*/, 0x1F /*mask*/, XAIE_ENABLE, 0 /*msel*/,
          0 /*arbiter*/));
  // Core Stream Switch column 26 row 1
  x = 26;
  y = 1;
  XAieTile_StrmConfigMstr(
      &(ctx->TileInst[x][y]),
      XAIETILE_STRSW_MPORT_SOUTH(&(ctx->TileInst[x][y]), 0), XAIE_ENABLE,
      XAIE_ENABLE,
      XAIETILE_STRSW_MPORT_CFGPKT(
          &(ctx->TileInst[x][y]),
          XAIETILE_STRSW_MPORT_SOUTH(&(ctx->TileInst[x][y]), 0),
          XAIE_DISABLE /*drop_header*/, 0x1 /*mask*/, 0 /*arbiter*/));
  XAieTile_StrmConfigMstr(
      &(ctx->TileInst[x][y]),
      XAIETILE_STRSW_MPORT_NORTH(&(ctx->TileInst[x][y]), 0), XAIE_ENABLE,
      XAIE_ENABLE,
      XAIETILE_STRSW_MPORT_CFGPKT(
          &(ctx->TileInst[x][y]),
          XAIETILE_STRSW_MPORT_NORTH(&(ctx->TileInst[x][y]), 0),
          XAIE_DISABLE /*drop_header*/, 0x2 /*mask*/, 0 /*arbiter*/));
  XAieTile_StrmConfigSlv(&(ctx->TileInst[x][y]),
                         XAIETILE_STRSW_SPORT_NORTH(&(ctx->TileInst[x][y]), 0),
                         XAIE_ENABLE, XAIE_ENABLE);
  XAieTile_StrmConfigSlvSlot(
      &(ctx->TileInst[x][y]),
      XAIETILE_STRSW_SPORT_NORTH(&(ctx->TileInst[x][y]), 0), 0 /*slot*/,
      XAIE_ENABLE,
      XAIETILE_STRSW_SLVSLOT_CFG(
          &(ctx->TileInst[x][y]),
          (XAIETILE_STRSW_SPORT_NORTH(&(ctx->TileInst[x][y]), 0)), 0 /*slot*/,
          0x0 /*ID value*/, 0x1F /*mask*/, XAIE_ENABLE, 0 /*msel*/,
          0 /*arbiter*/));
  XAieTile_StrmConfigSlv(&(ctx->TileInst[x][y]),
                         XAIETILE_STRSW_SPORT_SOUTH(&(ctx->TileInst[x][y]), 0),
                         XAIE_ENABLE, XAIE_ENABLE);
  XAieTile_StrmConfigSlvSlot(
      &(ctx->TileInst[x][y]),
      XAIETILE_STRSW_SPORT_SOUTH(&(ctx->TileInst[x][y]), 0), 0 /*slot*/,
      XAIE_ENABLE,
      XAIETILE_STRSW_SLVSLOT_CFG(
          &(ctx->TileInst[x][y]),
          (XAIETILE_STRSW_SPORT_SOUTH(&(ctx->TileInst[x][y]), 0)), 0 /*slot*/,
          0x0 /*ID value*/, 0x1A /*mask*/, XAIE_ENABLE, 1 /*msel*/,
          0 /*arbiter*/));
  // ShimMux column 26 row 0
  // NOTE ShimMux always connects from the south as directions are defined
  // relative to the tile stream switch
  x = 26;
  y = 0;
  XAieTile_ShimStrmDemuxConfig(&(ctx->TileInst[x][y]),
                               XAIETILE_SHIM_STRM_DEM_SOUTH2,
                               XAIETILE_SHIM_STRM_DEM_DMA);
  XAieTile_ShimStrmMuxConfig(&(ctx->TileInst[x][y]),
                             XAIETILE_SHIM_STRM_MUX_SOUTH7,
                             XAIETILE_SHIM_STRM_MUX_DMA);
  XAieTile_ShimStrmMuxConfig(&(ctx->TileInst[x][y]),
                             XAIETILE_SHIM_STRM_MUX_SOUTH3,
                             XAIETILE_SHIM_STRM_MUX_DMA);
} // mlir_aie_configure_switchboxes

const int buf9_offset = 4096;
int32_t mlir_aie_read_buffer_buf9(aie_libxaie_ctx_t *ctx, int index) {
  int32_t value =
      XAieTile_DmReadWord(&(ctx->TileInst[26][3]), buf9_offset + (index * 4));
  return value;
}
void mlir_aie_write_buffer_buf9(aie_libxaie_ctx_t *ctx, int index,
                                int32_t value) {
  int32_t int_value = value;
  return XAieTile_DmWriteWord(&(ctx->TileInst[26][3]),
                              buf9_offset + (index * 4), int_value);
}
const int buf10_offset = 8192;
int32_t mlir_aie_read_buffer_buf10(aie_libxaie_ctx_t *ctx, int index) {
  int32_t value =
      XAieTile_DmReadWord(&(ctx->TileInst[26][3]), buf10_offset + (index * 4));
  return value;
}
void mlir_aie_write_buffer_buf10(aie_libxaie_ctx_t *ctx, int index,
                                 int32_t value) {
  int32_t int_value = value;
  return XAieTile_DmWriteWord(&(ctx->TileInst[26][3]),
                              buf10_offset + (index * 4), int_value);
}
const int buf11_offset = 12288;
int32_t mlir_aie_read_buffer_buf11(aie_libxaie_ctx_t *ctx, int index) {
  int32_t value =
      XAieTile_DmReadWord(&(ctx->TileInst[26][3]), buf11_offset + (index * 4));
  return value;
}
void mlir_aie_write_buffer_buf11(aie_libxaie_ctx_t *ctx, int index,
                                 int32_t value) {
  int32_t int_value = value;
  return XAieTile_DmWriteWord(&(ctx->TileInst[26][3]),
                              buf11_offset + (index * 4), int_value);
}
const int buf5_offset = 4096;
int32_t mlir_aie_read_buffer_buf5(aie_libxaie_ctx_t *ctx, int index) {
  int32_t value =
      XAieTile_DmReadWord(&(ctx->TileInst[26][2]), buf5_offset + (index * 4));
  return value;
}
void mlir_aie_write_buffer_buf5(aie_libxaie_ctx_t *ctx, int index,
                                int32_t value) {
  int32_t int_value = value;
  return XAieTile_DmWriteWord(&(ctx->TileInst[26][2]),
                              buf5_offset + (index * 4), int_value);
}
const int buf6_offset = 8192;
int32_t mlir_aie_read_buffer_buf6(aie_libxaie_ctx_t *ctx, int index) {
  int32_t value =
      XAieTile_DmReadWord(&(ctx->TileInst[26][2]), buf6_offset + (index * 4));
  return value;
}
void mlir_aie_write_buffer_buf6(aie_libxaie_ctx_t *ctx, int index,
                                int32_t value) {
  int32_t int_value = value;
  return XAieTile_DmWriteWord(&(ctx->TileInst[26][2]),
                              buf6_offset + (index * 4), int_value);
}
const int buf7_offset = 12288;
int32_t mlir_aie_read_buffer_buf7(aie_libxaie_ctx_t *ctx, int index) {
  int32_t value =
      XAieTile_DmReadWord(&(ctx->TileInst[26][2]), buf7_offset + (index * 4));
  return value;
}
void mlir_aie_write_buffer_buf7(aie_libxaie_ctx_t *ctx, int index,
                                int32_t value) {
  int32_t int_value = value;
  return XAieTile_DmWriteWord(&(ctx->TileInst[26][2]),
                              buf7_offset + (index * 4), int_value);
}
const int buf8_offset = 16384;
int32_t mlir_aie_read_buffer_buf8(aie_libxaie_ctx_t *ctx, int index) {
  int32_t value =
      XAieTile_DmReadWord(&(ctx->TileInst[26][2]), buf8_offset + (index * 4));
  return value;
}
void mlir_aie_write_buffer_buf8(aie_libxaie_ctx_t *ctx, int index,
                                int32_t value) {
  int32_t int_value = value;
  return XAieTile_DmWriteWord(&(ctx->TileInst[26][2]),
                              buf8_offset + (index * 4), int_value);
}
