void mlir_aie_configure_cores(aie_libxaie_ctx_t *ctx) {
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
  {
    int ret = XAieGbl_LoadElf(&(ctx->TileInst[10][2]), (u8 *)"core_10_2.elf",
                              XAIE_ENABLE);
    if (ret == XAIELIB_FAILURE)
      printf("Failed to load elf for Core[%d,%d], ret is %d", 10, 2, ret);
    assert(ret != XAIELIB_FAILURE);
  }
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
  {
    int ret = XAieGbl_LoadElf(&(ctx->TileInst[10][3]), (u8 *)"core_10_3.elf",
                              XAIE_ENABLE);
    if (ret == XAIELIB_FAILURE)
      printf("Failed to load elf for Core[%d,%d], ret is %d", 10, 3, ret);
    assert(ret != XAIELIB_FAILURE);
  }
  XAieTile_CoreControl(&(ctx->TileInst[10][4]), XAIE_DISABLE, XAIE_ENABLE);
  // Reset configuration
  // Program Memory
  for (int i = 0x20000; i <= 0x23FFF; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[10][4]))->TileAddr + i, 0);
  // TileDMA
  for (int i = 0x1D000; i <= 0x1D1F8; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[10][4]))->TileAddr + i, 0);
  for (int i = 0x1DE00; i <= 0x1DE00; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[10][4]))->TileAddr + i, 0);
  for (int i = 0x1DE08; i <= 0x1DE08; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[10][4]))->TileAddr + i, 0);
  for (int i = 0x1DE10; i <= 0x1DE10; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[10][4]))->TileAddr + i, 0);
  for (int i = 0x1DE18; i <= 0x1DE18; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[10][4]))->TileAddr + i, 0);
  // Stream Switch master config
  for (int i = 0x3F000; i <= 0x3F060; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[10][4]))->TileAddr + i, 0);
  // Stream Switch slave config
  for (int i = 0x3F100; i <= 0x3F168; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[10][4]))->TileAddr + i, 0);
  // Stream Switch slave slot config
  for (int i = 0x3F200; i <= 0x3F3AC; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[10][4]))->TileAddr + i, 0);
  for (int l = 0; l < 16; l++)
    XAieTile_LockRelease(&(ctx->TileInst[10][4]), l, 0x0, 0);
  {
    int ret = XAieGbl_LoadElf(&(ctx->TileInst[10][4]), (u8 *)"core_10_4.elf",
                              XAIE_ENABLE);
    if (ret == XAIELIB_FAILURE)
      printf("Failed to load elf for Core[%d,%d], ret is %d", 10, 4, ret);
    assert(ret != XAIELIB_FAILURE);
  }
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
  {
    int ret = XAieGbl_LoadElf(&(ctx->TileInst[11][2]), (u8 *)"core_11_2.elf",
                              XAIE_ENABLE);
    if (ret == XAIELIB_FAILURE)
      printf("Failed to load elf for Core[%d,%d], ret is %d", 11, 2, ret);
    assert(ret != XAIELIB_FAILURE);
  }
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
  {
    int ret = XAieGbl_LoadElf(&(ctx->TileInst[11][3]), (u8 *)"core_11_3.elf",
                              XAIE_ENABLE);
    if (ret == XAIELIB_FAILURE)
      printf("Failed to load elf for Core[%d,%d], ret is %d", 11, 3, ret);
    assert(ret != XAIELIB_FAILURE);
  }
  XAieTile_CoreControl(&(ctx->TileInst[11][4]), XAIE_DISABLE, XAIE_ENABLE);
  // Reset configuration
  // Program Memory
  for (int i = 0x20000; i <= 0x23FFF; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[11][4]))->TileAddr + i, 0);
  // TileDMA
  for (int i = 0x1D000; i <= 0x1D1F8; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[11][4]))->TileAddr + i, 0);
  for (int i = 0x1DE00; i <= 0x1DE00; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[11][4]))->TileAddr + i, 0);
  for (int i = 0x1DE08; i <= 0x1DE08; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[11][4]))->TileAddr + i, 0);
  for (int i = 0x1DE10; i <= 0x1DE10; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[11][4]))->TileAddr + i, 0);
  for (int i = 0x1DE18; i <= 0x1DE18; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[11][4]))->TileAddr + i, 0);
  // Stream Switch master config
  for (int i = 0x3F000; i <= 0x3F060; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[11][4]))->TileAddr + i, 0);
  // Stream Switch slave config
  for (int i = 0x3F100; i <= 0x3F168; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[11][4]))->TileAddr + i, 0);
  // Stream Switch slave slot config
  for (int i = 0x3F200; i <= 0x3F3AC; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[11][4]))->TileAddr + i, 0);
  for (int l = 0; l < 16; l++)
    XAieTile_LockRelease(&(ctx->TileInst[11][4]), l, 0x0, 0);
  {
    int ret = XAieGbl_LoadElf(&(ctx->TileInst[11][4]), (u8 *)"core_11_4.elf",
                              XAIE_ENABLE);
    if (ret == XAIELIB_FAILURE)
      printf("Failed to load elf for Core[%d,%d], ret is %d", 11, 4, ret);
    assert(ret != XAIELIB_FAILURE);
  }
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
  {
    int ret = XAieGbl_LoadElf(&(ctx->TileInst[12][2]), (u8 *)"core_12_2.elf",
                              XAIE_ENABLE);
    if (ret == XAIELIB_FAILURE)
      printf("Failed to load elf for Core[%d,%d], ret is %d", 12, 2, ret);
    assert(ret != XAIELIB_FAILURE);
  }
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
  {
    int ret = XAieGbl_LoadElf(&(ctx->TileInst[12][3]), (u8 *)"core_12_3.elf",
                              XAIE_ENABLE);
    if (ret == XAIELIB_FAILURE)
      printf("Failed to load elf for Core[%d,%d], ret is %d", 12, 3, ret);
    assert(ret != XAIELIB_FAILURE);
  }
  XAieTile_CoreControl(&(ctx->TileInst[12][4]), XAIE_DISABLE, XAIE_ENABLE);
  // Reset configuration
  // Program Memory
  for (int i = 0x20000; i <= 0x23FFF; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[12][4]))->TileAddr + i, 0);
  // TileDMA
  for (int i = 0x1D000; i <= 0x1D1F8; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[12][4]))->TileAddr + i, 0);
  for (int i = 0x1DE00; i <= 0x1DE00; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[12][4]))->TileAddr + i, 0);
  for (int i = 0x1DE08; i <= 0x1DE08; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[12][4]))->TileAddr + i, 0);
  for (int i = 0x1DE10; i <= 0x1DE10; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[12][4]))->TileAddr + i, 0);
  for (int i = 0x1DE18; i <= 0x1DE18; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[12][4]))->TileAddr + i, 0);
  // Stream Switch master config
  for (int i = 0x3F000; i <= 0x3F060; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[12][4]))->TileAddr + i, 0);
  // Stream Switch slave config
  for (int i = 0x3F100; i <= 0x3F168; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[12][4]))->TileAddr + i, 0);
  // Stream Switch slave slot config
  for (int i = 0x3F200; i <= 0x3F3AC; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[12][4]))->TileAddr + i, 0);
  for (int l = 0; l < 16; l++)
    XAieTile_LockRelease(&(ctx->TileInst[12][4]), l, 0x0, 0);
  {
    int ret = XAieGbl_LoadElf(&(ctx->TileInst[12][4]), (u8 *)"core_12_4.elf",
                              XAIE_ENABLE);
    if (ret == XAIELIB_FAILURE)
      printf("Failed to load elf for Core[%d,%d], ret is %d", 12, 4, ret);
    assert(ret != XAIELIB_FAILURE);
  }
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
  XAieTile_ShimColumnReset(&(ctx->TileInst[0][0]), XAIE_RESETENABLE);
  // Reset configuration
  XAieTile_ShimColumnReset(&(ctx->TileInst[0][0]), XAIE_RESETDISABLE);
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
  XAieTile_CoreControl(&(ctx->TileInst[0][4]), XAIE_DISABLE, XAIE_ENABLE);
  // Reset configuration
  // Program Memory
  for (int i = 0x20000; i <= 0x23FFF; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[0][4]))->TileAddr + i, 0);
  // TileDMA
  for (int i = 0x1D000; i <= 0x1D1F8; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[0][4]))->TileAddr + i, 0);
  for (int i = 0x1DE00; i <= 0x1DE00; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[0][4]))->TileAddr + i, 0);
  for (int i = 0x1DE08; i <= 0x1DE08; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[0][4]))->TileAddr + i, 0);
  for (int i = 0x1DE10; i <= 0x1DE10; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[0][4]))->TileAddr + i, 0);
  for (int i = 0x1DE18; i <= 0x1DE18; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[0][4]))->TileAddr + i, 0);
  // Stream Switch master config
  for (int i = 0x3F000; i <= 0x3F060; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[0][4]))->TileAddr + i, 0);
  // Stream Switch slave config
  for (int i = 0x3F100; i <= 0x3F168; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[0][4]))->TileAddr + i, 0);
  // Stream Switch slave slot config
  for (int i = 0x3F200; i <= 0x3F3AC; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[0][4]))->TileAddr + i, 0);
  for (int l = 0; l < 16; l++)
    XAieTile_LockRelease(&(ctx->TileInst[0][4]), l, 0x0, 0);
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
  XAieTile_CoreControl(&(ctx->TileInst[1][4]), XAIE_DISABLE, XAIE_ENABLE);
  // Reset configuration
  // Program Memory
  for (int i = 0x20000; i <= 0x23FFF; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[1][4]))->TileAddr + i, 0);
  // TileDMA
  for (int i = 0x1D000; i <= 0x1D1F8; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[1][4]))->TileAddr + i, 0);
  for (int i = 0x1DE00; i <= 0x1DE00; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[1][4]))->TileAddr + i, 0);
  for (int i = 0x1DE08; i <= 0x1DE08; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[1][4]))->TileAddr + i, 0);
  for (int i = 0x1DE10; i <= 0x1DE10; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[1][4]))->TileAddr + i, 0);
  for (int i = 0x1DE18; i <= 0x1DE18; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[1][4]))->TileAddr + i, 0);
  // Stream Switch master config
  for (int i = 0x3F000; i <= 0x3F060; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[1][4]))->TileAddr + i, 0);
  // Stream Switch slave config
  for (int i = 0x3F100; i <= 0x3F168; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[1][4]))->TileAddr + i, 0);
  // Stream Switch slave slot config
  for (int i = 0x3F200; i <= 0x3F3AC; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[1][4]))->TileAddr + i, 0);
  for (int l = 0; l < 16; l++)
    XAieTile_LockRelease(&(ctx->TileInst[1][4]), l, 0x0, 0);
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
  XAieTile_CoreControl(&(ctx->TileInst[2][4]), XAIE_DISABLE, XAIE_ENABLE);
  // Reset configuration
  // Program Memory
  for (int i = 0x20000; i <= 0x23FFF; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[2][4]))->TileAddr + i, 0);
  // TileDMA
  for (int i = 0x1D000; i <= 0x1D1F8; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[2][4]))->TileAddr + i, 0);
  for (int i = 0x1DE00; i <= 0x1DE00; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[2][4]))->TileAddr + i, 0);
  for (int i = 0x1DE08; i <= 0x1DE08; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[2][4]))->TileAddr + i, 0);
  for (int i = 0x1DE10; i <= 0x1DE10; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[2][4]))->TileAddr + i, 0);
  for (int i = 0x1DE18; i <= 0x1DE18; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[2][4]))->TileAddr + i, 0);
  // Stream Switch master config
  for (int i = 0x3F000; i <= 0x3F060; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[2][4]))->TileAddr + i, 0);
  // Stream Switch slave config
  for (int i = 0x3F100; i <= 0x3F168; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[2][4]))->TileAddr + i, 0);
  // Stream Switch slave slot config
  for (int i = 0x3F200; i <= 0x3F3AC; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[2][4]))->TileAddr + i, 0);
  for (int l = 0; l < 16; l++)
    XAieTile_LockRelease(&(ctx->TileInst[2][4]), l, 0x0, 0);
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
  XAieTile_CoreControl(&(ctx->TileInst[3][4]), XAIE_DISABLE, XAIE_ENABLE);
  // Reset configuration
  // Program Memory
  for (int i = 0x20000; i <= 0x23FFF; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[3][4]))->TileAddr + i, 0);
  // TileDMA
  for (int i = 0x1D000; i <= 0x1D1F8; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[3][4]))->TileAddr + i, 0);
  for (int i = 0x1DE00; i <= 0x1DE00; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[3][4]))->TileAddr + i, 0);
  for (int i = 0x1DE08; i <= 0x1DE08; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[3][4]))->TileAddr + i, 0);
  for (int i = 0x1DE10; i <= 0x1DE10; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[3][4]))->TileAddr + i, 0);
  for (int i = 0x1DE18; i <= 0x1DE18; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[3][4]))->TileAddr + i, 0);
  // Stream Switch master config
  for (int i = 0x3F000; i <= 0x3F060; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[3][4]))->TileAddr + i, 0);
  // Stream Switch slave config
  for (int i = 0x3F100; i <= 0x3F168; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[3][4]))->TileAddr + i, 0);
  // Stream Switch slave slot config
  for (int i = 0x3F200; i <= 0x3F3AC; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[3][4]))->TileAddr + i, 0);
  for (int l = 0; l < 16; l++)
    XAieTile_LockRelease(&(ctx->TileInst[3][4]), l, 0x0, 0);
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
  XAieTile_CoreControl(&(ctx->TileInst[4][4]), XAIE_DISABLE, XAIE_ENABLE);
  // Reset configuration
  // Program Memory
  for (int i = 0x20000; i <= 0x23FFF; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[4][4]))->TileAddr + i, 0);
  // TileDMA
  for (int i = 0x1D000; i <= 0x1D1F8; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[4][4]))->TileAddr + i, 0);
  for (int i = 0x1DE00; i <= 0x1DE00; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[4][4]))->TileAddr + i, 0);
  for (int i = 0x1DE08; i <= 0x1DE08; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[4][4]))->TileAddr + i, 0);
  for (int i = 0x1DE10; i <= 0x1DE10; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[4][4]))->TileAddr + i, 0);
  for (int i = 0x1DE18; i <= 0x1DE18; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[4][4]))->TileAddr + i, 0);
  // Stream Switch master config
  for (int i = 0x3F000; i <= 0x3F060; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[4][4]))->TileAddr + i, 0);
  // Stream Switch slave config
  for (int i = 0x3F100; i <= 0x3F168; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[4][4]))->TileAddr + i, 0);
  // Stream Switch slave slot config
  for (int i = 0x3F200; i <= 0x3F3AC; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[4][4]))->TileAddr + i, 0);
  for (int l = 0; l < 16; l++)
    XAieTile_LockRelease(&(ctx->TileInst[4][4]), l, 0x0, 0);
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
  XAieTile_CoreControl(&(ctx->TileInst[5][4]), XAIE_DISABLE, XAIE_ENABLE);
  // Reset configuration
  // Program Memory
  for (int i = 0x20000; i <= 0x23FFF; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[5][4]))->TileAddr + i, 0);
  // TileDMA
  for (int i = 0x1D000; i <= 0x1D1F8; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[5][4]))->TileAddr + i, 0);
  for (int i = 0x1DE00; i <= 0x1DE00; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[5][4]))->TileAddr + i, 0);
  for (int i = 0x1DE08; i <= 0x1DE08; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[5][4]))->TileAddr + i, 0);
  for (int i = 0x1DE10; i <= 0x1DE10; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[5][4]))->TileAddr + i, 0);
  for (int i = 0x1DE18; i <= 0x1DE18; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[5][4]))->TileAddr + i, 0);
  // Stream Switch master config
  for (int i = 0x3F000; i <= 0x3F060; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[5][4]))->TileAddr + i, 0);
  // Stream Switch slave config
  for (int i = 0x3F100; i <= 0x3F168; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[5][4]))->TileAddr + i, 0);
  // Stream Switch slave slot config
  for (int i = 0x3F200; i <= 0x3F3AC; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[5][4]))->TileAddr + i, 0);
  for (int l = 0; l < 16; l++)
    XAieTile_LockRelease(&(ctx->TileInst[5][4]), l, 0x0, 0);
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
  XAieTile_CoreControl(&(ctx->TileInst[6][4]), XAIE_DISABLE, XAIE_ENABLE);
  // Reset configuration
  // Program Memory
  for (int i = 0x20000; i <= 0x23FFF; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[6][4]))->TileAddr + i, 0);
  // TileDMA
  for (int i = 0x1D000; i <= 0x1D1F8; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[6][4]))->TileAddr + i, 0);
  for (int i = 0x1DE00; i <= 0x1DE00; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[6][4]))->TileAddr + i, 0);
  for (int i = 0x1DE08; i <= 0x1DE08; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[6][4]))->TileAddr + i, 0);
  for (int i = 0x1DE10; i <= 0x1DE10; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[6][4]))->TileAddr + i, 0);
  for (int i = 0x1DE18; i <= 0x1DE18; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[6][4]))->TileAddr + i, 0);
  // Stream Switch master config
  for (int i = 0x3F000; i <= 0x3F060; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[6][4]))->TileAddr + i, 0);
  // Stream Switch slave config
  for (int i = 0x3F100; i <= 0x3F168; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[6][4]))->TileAddr + i, 0);
  // Stream Switch slave slot config
  for (int i = 0x3F200; i <= 0x3F3AC; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[6][4]))->TileAddr + i, 0);
  for (int l = 0; l < 16; l++)
    XAieTile_LockRelease(&(ctx->TileInst[6][4]), l, 0x0, 0);
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
  XAieTile_CoreControl(&(ctx->TileInst[7][4]), XAIE_DISABLE, XAIE_ENABLE);
  // Reset configuration
  // Program Memory
  for (int i = 0x20000; i <= 0x23FFF; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[7][4]))->TileAddr + i, 0);
  // TileDMA
  for (int i = 0x1D000; i <= 0x1D1F8; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[7][4]))->TileAddr + i, 0);
  for (int i = 0x1DE00; i <= 0x1DE00; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[7][4]))->TileAddr + i, 0);
  for (int i = 0x1DE08; i <= 0x1DE08; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[7][4]))->TileAddr + i, 0);
  for (int i = 0x1DE10; i <= 0x1DE10; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[7][4]))->TileAddr + i, 0);
  for (int i = 0x1DE18; i <= 0x1DE18; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[7][4]))->TileAddr + i, 0);
  // Stream Switch master config
  for (int i = 0x3F000; i <= 0x3F060; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[7][4]))->TileAddr + i, 0);
  // Stream Switch slave config
  for (int i = 0x3F100; i <= 0x3F168; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[7][4]))->TileAddr + i, 0);
  // Stream Switch slave slot config
  for (int i = 0x3F200; i <= 0x3F3AC; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[7][4]))->TileAddr + i, 0);
  for (int l = 0; l < 16; l++)
    XAieTile_LockRelease(&(ctx->TileInst[7][4]), l, 0x0, 0);
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
  XAieTile_CoreControl(&(ctx->TileInst[8][4]), XAIE_DISABLE, XAIE_ENABLE);
  // Reset configuration
  // Program Memory
  for (int i = 0x20000; i <= 0x23FFF; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[8][4]))->TileAddr + i, 0);
  // TileDMA
  for (int i = 0x1D000; i <= 0x1D1F8; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[8][4]))->TileAddr + i, 0);
  for (int i = 0x1DE00; i <= 0x1DE00; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[8][4]))->TileAddr + i, 0);
  for (int i = 0x1DE08; i <= 0x1DE08; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[8][4]))->TileAddr + i, 0);
  for (int i = 0x1DE10; i <= 0x1DE10; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[8][4]))->TileAddr + i, 0);
  for (int i = 0x1DE18; i <= 0x1DE18; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[8][4]))->TileAddr + i, 0);
  // Stream Switch master config
  for (int i = 0x3F000; i <= 0x3F060; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[8][4]))->TileAddr + i, 0);
  // Stream Switch slave config
  for (int i = 0x3F100; i <= 0x3F168; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[8][4]))->TileAddr + i, 0);
  // Stream Switch slave slot config
  for (int i = 0x3F200; i <= 0x3F3AC; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[8][4]))->TileAddr + i, 0);
  for (int l = 0; l < 16; l++)
    XAieTile_LockRelease(&(ctx->TileInst[8][4]), l, 0x0, 0);
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
  XAieTile_CoreControl(&(ctx->TileInst[9][4]), XAIE_DISABLE, XAIE_ENABLE);
  // Reset configuration
  // Program Memory
  for (int i = 0x20000; i <= 0x23FFF; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[9][4]))->TileAddr + i, 0);
  // TileDMA
  for (int i = 0x1D000; i <= 0x1D1F8; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[9][4]))->TileAddr + i, 0);
  for (int i = 0x1DE00; i <= 0x1DE00; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[9][4]))->TileAddr + i, 0);
  for (int i = 0x1DE08; i <= 0x1DE08; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[9][4]))->TileAddr + i, 0);
  for (int i = 0x1DE10; i <= 0x1DE10; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[9][4]))->TileAddr + i, 0);
  for (int i = 0x1DE18; i <= 0x1DE18; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[9][4]))->TileAddr + i, 0);
  // Stream Switch master config
  for (int i = 0x3F000; i <= 0x3F060; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[9][4]))->TileAddr + i, 0);
  // Stream Switch slave config
  for (int i = 0x3F100; i <= 0x3F168; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[9][4]))->TileAddr + i, 0);
  // Stream Switch slave slot config
  for (int i = 0x3F200; i <= 0x3F3AC; i += 4)
    XAieGbl_Write32((&(ctx->TileInst[9][4]))->TileAddr + i, 0);
  for (int l = 0; l < 16; l++)
    XAieTile_LockRelease(&(ctx->TileInst[9][4]), l, 0x0, 0);
} // mlir_aie_configure_cores

void mlir_aie_start_cores(aie_libxaie_ctx_t *ctx) {
  XAieTile_CoreControl(&(ctx->TileInst[10][2]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[10][3]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[10][4]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[11][2]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[11][3]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[11][4]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[12][2]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[12][3]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[12][4]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[12][1]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[11][1]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[10][1]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[0][1]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[0][2]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[0][3]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[0][4]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[1][1]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[1][2]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[1][3]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[1][4]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[2][1]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[2][2]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[2][3]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[2][4]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[3][1]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[3][2]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[3][3]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[3][4]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[4][1]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[4][2]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[4][3]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[4][4]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[5][1]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[5][2]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[5][3]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[5][4]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[6][1]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[6][2]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[6][3]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[6][4]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[7][1]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[7][2]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[7][3]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[7][4]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[8][1]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[8][2]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[8][3]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[8][4]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[9][1]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[9][2]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[9][3]), XAIE_ENABLE, XAIE_DISABLE);
  XAieTile_CoreControl(&(ctx->TileInst[9][4]), XAIE_ENABLE, XAIE_DISABLE);
} // mlir_aie_start_cores

void mlir_aie_configure_dmas(aie_libxaie_ctx_t *ctx) {
  XAieDma_TileInitialize(&(ctx->TileInst[10][2]), &(ctx->TileDMAInst[10][2]));
  XAieDma_TileBdClearAll(&(ctx->TileDMAInst[10][2]));
  XAieDma_TileChResetAll(&(ctx->TileDMAInst[10][2]));
  XAieDma_TileBdSetLock(&(ctx->TileDMAInst[10][2]), /* bd */ 0,
                        XAIEDMA_TILE_BD_ADDRA, /* lockID */ 1, XAIE_ENABLE,
                        /* release */ 1, XAIE_ENABLE, /* acquire */ 0);
  XAieDma_TileBdSetAdrLenMod(&(ctx->TileDMAInst[10][2]), /* bd */ 0,
                             /* addrA */ 0x3000, /* addrB */ 0x0,
                             /* len */ 1024 * 4, /* ABMode */ XAIE_DISABLE,
                             /* FIFOMode */ XAIE_DISABLE);
  XAieDma_TileBdSetNext(&(ctx->TileDMAInst[10][2]), /* bd */ 0, /* nextbd */ 0);
  XAieDma_TileBdSetPkt(&(ctx->TileDMAInst[10][2]), /* bd */ 0, /* en */ 1,
                       /* type */ 0, /* id */ 4);
  XAieDma_TileBdWrite(&(ctx->TileDMAInst[10][2]), /* bd */ 0);
  XAieDma_TileBdSetLock(&(ctx->TileDMAInst[10][2]), /* bd */ 1,
                        XAIEDMA_TILE_BD_ADDRA, /* lockID */ 0, XAIE_ENABLE,
                        /* release */ 1, XAIE_ENABLE, /* acquire */ 0);
  XAieDma_TileBdSetAdrLenMod(&(ctx->TileDMAInst[10][2]), /* bd */ 1,
                             /* addrA */ 0x2000, /* addrB */ 0x0,
                             /* len */ 1024 * 4, /* ABMode */ XAIE_DISABLE,
                             /* FIFOMode */ XAIE_DISABLE);
  XAieDma_TileBdSetNext(&(ctx->TileDMAInst[10][2]), /* bd */ 1, /* nextbd */ 1);
  XAieDma_TileBdSetPkt(&(ctx->TileDMAInst[10][2]), /* bd */ 1, /* en */ 1,
                       /* type */ 0, /* id */ 0);
  XAieDma_TileBdWrite(&(ctx->TileDMAInst[10][2]), /* bd */ 1);
  XAieDma_TileSetStartBd((&(ctx->TileDMAInst[10][2])), XAIEDMA_TILE_CHNUM_S2MM0,
                         /* bd */ 0);
  XAieDma_TileChControl(&(ctx->TileDMAInst[10][2]), XAIEDMA_TILE_CHNUM_S2MM0,
                        XAIE_RESETDISABLE, XAIE_ENABLE);
  XAieDma_TileSetStartBd((&(ctx->TileDMAInst[10][2])), XAIEDMA_TILE_CHNUM_S2MM1,
                         /* bd */ 1);
  XAieDma_TileChControl(&(ctx->TileDMAInst[10][2]), XAIEDMA_TILE_CHNUM_S2MM1,
                        XAIE_RESETDISABLE, XAIE_ENABLE);
  XAieDma_TileInitialize(&(ctx->TileInst[10][3]), &(ctx->TileDMAInst[10][3]));
  XAieDma_TileBdClearAll(&(ctx->TileDMAInst[10][3]));
  XAieDma_TileChResetAll(&(ctx->TileDMAInst[10][3]));
  XAieDma_TileBdSetLock(&(ctx->TileDMAInst[10][3]), /* bd */ 0,
                        XAIEDMA_TILE_BD_ADDRA, /* lockID */ 1, XAIE_ENABLE,
                        /* release */ 1, XAIE_ENABLE, /* acquire */ 0);
  XAieDma_TileBdSetAdrLenMod(&(ctx->TileDMAInst[10][3]), /* bd */ 0,
                             /* addrA */ 0x2000, /* addrB */ 0x0,
                             /* len */ 1024 * 4, /* ABMode */ XAIE_DISABLE,
                             /* FIFOMode */ XAIE_DISABLE);
  XAieDma_TileBdSetNext(&(ctx->TileDMAInst[10][3]), /* bd */ 0, /* nextbd */ 0);
  XAieDma_TileBdSetPkt(&(ctx->TileDMAInst[10][3]), /* bd */ 0, /* en */ 1,
                       /* type */ 0, /* id */ 1);
  XAieDma_TileBdWrite(&(ctx->TileDMAInst[10][3]), /* bd */ 0);
  XAieDma_TileBdSetLock(&(ctx->TileDMAInst[10][3]), /* bd */ 1,
                        XAIEDMA_TILE_BD_ADDRA, /* lockID */ 0, XAIE_ENABLE,
                        /* release */ 1, XAIE_ENABLE, /* acquire */ 0);
  XAieDma_TileBdSetAdrLenMod(&(ctx->TileDMAInst[10][3]), /* bd */ 1,
                             /* addrA */ 0x3000, /* addrB */ 0x0,
                             /* len */ 1024 * 4, /* ABMode */ XAIE_DISABLE,
                             /* FIFOMode */ XAIE_DISABLE);
  XAieDma_TileBdSetNext(&(ctx->TileDMAInst[10][3]), /* bd */ 1, /* nextbd */ 1);
  XAieDma_TileBdSetPkt(&(ctx->TileDMAInst[10][3]), /* bd */ 1, /* en */ 1,
                       /* type */ 0, /* id */ 5);
  XAieDma_TileBdWrite(&(ctx->TileDMAInst[10][3]), /* bd */ 1);
  XAieDma_TileSetStartBd((&(ctx->TileDMAInst[10][3])), XAIEDMA_TILE_CHNUM_S2MM0,
                         /* bd */ 0);
  XAieDma_TileChControl(&(ctx->TileDMAInst[10][3]), XAIEDMA_TILE_CHNUM_S2MM0,
                        XAIE_RESETDISABLE, XAIE_ENABLE);
  XAieDma_TileSetStartBd((&(ctx->TileDMAInst[10][3])), XAIEDMA_TILE_CHNUM_S2MM1,
                         /* bd */ 1);
  XAieDma_TileChControl(&(ctx->TileDMAInst[10][3]), XAIEDMA_TILE_CHNUM_S2MM1,
                        XAIE_RESETDISABLE, XAIE_ENABLE);
  XAieDma_TileInitialize(&(ctx->TileInst[10][4]), &(ctx->TileDMAInst[10][4]));
  XAieDma_TileBdClearAll(&(ctx->TileDMAInst[10][4]));
  XAieDma_TileChResetAll(&(ctx->TileDMAInst[10][4]));
  XAieDma_TileBdSetLock(&(ctx->TileDMAInst[10][4]), /* bd */ 0,
                        XAIEDMA_TILE_BD_ADDRA, /* lockID */ 1, XAIE_ENABLE,
                        /* release */ 1, XAIE_ENABLE, /* acquire */ 0);
  XAieDma_TileBdSetAdrLenMod(&(ctx->TileDMAInst[10][4]), /* bd */ 0,
                             /* addrA */ 0x3000, /* addrB */ 0x0,
                             /* len */ 1024 * 4, /* ABMode */ XAIE_DISABLE,
                             /* FIFOMode */ XAIE_DISABLE);
  XAieDma_TileBdSetNext(&(ctx->TileDMAInst[10][4]), /* bd */ 0, /* nextbd */ 0);
  XAieDma_TileBdSetPkt(&(ctx->TileDMAInst[10][4]), /* bd */ 0, /* en */ 1,
                       /* type */ 0, /* id */ 6);
  XAieDma_TileBdWrite(&(ctx->TileDMAInst[10][4]), /* bd */ 0);
  XAieDma_TileBdSetLock(&(ctx->TileDMAInst[10][4]), /* bd */ 1,
                        XAIEDMA_TILE_BD_ADDRA, /* lockID */ 2, XAIE_ENABLE,
                        /* release */ 1, XAIE_ENABLE, /* acquire */ 0);
  XAieDma_TileBdSetAdrLenMod(&(ctx->TileDMAInst[10][4]), /* bd */ 1,
                             /* addrA */ 0x2000, /* addrB */ 0x0,
                             /* len */ 1024 * 4, /* ABMode */ XAIE_DISABLE,
                             /* FIFOMode */ XAIE_DISABLE);
  XAieDma_TileBdSetNext(&(ctx->TileDMAInst[10][4]), /* bd */ 1, /* nextbd */ 1);
  XAieDma_TileBdSetPkt(&(ctx->TileDMAInst[10][4]), /* bd */ 1, /* en */ 1,
                       /* type */ 0, /* id */ 2);
  XAieDma_TileBdWrite(&(ctx->TileDMAInst[10][4]), /* bd */ 1);
  XAieDma_TileBdSetLock(&(ctx->TileDMAInst[10][4]), /* bd */ 2,
                        XAIEDMA_TILE_BD_ADDRA, /* lockID */ 0, XAIE_ENABLE,
                        /* release */ 0, XAIE_ENABLE, /* acquire */ 1);
  XAieDma_TileBdSetAdrLenMod(&(ctx->TileDMAInst[10][4]), /* bd */ 2,
                             /* addrA */ 0x1000, /* addrB */ 0x0,
                             /* len */ 1024 * 4, /* ABMode */ XAIE_DISABLE,
                             /* FIFOMode */ XAIE_DISABLE);
  XAieDma_TileBdSetNext(&(ctx->TileDMAInst[10][4]), /* bd */ 2, /* nextbd */ 2);
  XAieDma_TileBdSetPkt(&(ctx->TileDMAInst[10][4]), /* bd */ 2, /* en */ 1,
                       /* type */ 0, /* id */ 0);
  XAieDma_TileBdWrite(&(ctx->TileDMAInst[10][4]), /* bd */ 2);
  XAieDma_TileSetStartBd((&(ctx->TileDMAInst[10][4])), XAIEDMA_TILE_CHNUM_S2MM0,
                         /* bd */ 0);
  XAieDma_TileChControl(&(ctx->TileDMAInst[10][4]), XAIEDMA_TILE_CHNUM_S2MM0,
                        XAIE_RESETDISABLE, XAIE_ENABLE);
  XAieDma_TileSetStartBd((&(ctx->TileDMAInst[10][4])), XAIEDMA_TILE_CHNUM_S2MM1,
                         /* bd */ 1);
  XAieDma_TileChControl(&(ctx->TileDMAInst[10][4]), XAIEDMA_TILE_CHNUM_S2MM1,
                        XAIE_RESETDISABLE, XAIE_ENABLE);
  XAieDma_TileSetStartBd((&(ctx->TileDMAInst[10][4])), XAIEDMA_TILE_CHNUM_MM2S0,
                         /* bd */ 2);
  XAieDma_TileChControl(&(ctx->TileDMAInst[10][4]), XAIEDMA_TILE_CHNUM_MM2S0,
                        XAIE_RESETDISABLE, XAIE_ENABLE);
  XAieDma_TileInitialize(&(ctx->TileInst[11][2]), &(ctx->TileDMAInst[11][2]));
  XAieDma_TileBdClearAll(&(ctx->TileDMAInst[11][2]));
  XAieDma_TileChResetAll(&(ctx->TileDMAInst[11][2]));
  XAieDma_TileBdSetLock(&(ctx->TileDMAInst[11][2]), /* bd */ 0,
                        XAIEDMA_TILE_BD_ADDRA, /* lockID */ 0, XAIE_ENABLE,
                        /* release */ 1, XAIE_ENABLE, /* acquire */ 0);
  XAieDma_TileBdSetAdrLenMod(&(ctx->TileDMAInst[11][2]), /* bd */ 0,
                             /* addrA */ 0x3000, /* addrB */ 0x0,
                             /* len */ 1024 * 4, /* ABMode */ XAIE_DISABLE,
                             /* FIFOMode */ XAIE_DISABLE);
  XAieDma_TileBdSetNext(&(ctx->TileDMAInst[11][2]), /* bd */ 0, /* nextbd */ 0);
  XAieDma_TileBdSetPkt(&(ctx->TileDMAInst[11][2]), /* bd */ 0, /* en */ 1,
                       /* type */ 0, /* id */ 4);
  XAieDma_TileBdWrite(&(ctx->TileDMAInst[11][2]), /* bd */ 0);
  XAieDma_TileBdSetLock(&(ctx->TileDMAInst[11][2]), /* bd */ 1,
                        XAIEDMA_TILE_BD_ADDRA, /* lockID */ 1, XAIE_ENABLE,
                        /* release */ 1, XAIE_ENABLE, /* acquire */ 0);
  XAieDma_TileBdSetAdrLenMod(&(ctx->TileDMAInst[11][2]), /* bd */ 1,
                             /* addrA */ 0x2000, /* addrB */ 0x0,
                             /* len */ 1024 * 4, /* ABMode */ XAIE_DISABLE,
                             /* FIFOMode */ XAIE_DISABLE);
  XAieDma_TileBdSetNext(&(ctx->TileDMAInst[11][2]), /* bd */ 1, /* nextbd */ 1);
  XAieDma_TileBdSetPkt(&(ctx->TileDMAInst[11][2]), /* bd */ 1, /* en */ 1,
                       /* type */ 0, /* id */ 0);
  XAieDma_TileBdWrite(&(ctx->TileDMAInst[11][2]), /* bd */ 1);
  XAieDma_TileSetStartBd((&(ctx->TileDMAInst[11][2])), XAIEDMA_TILE_CHNUM_S2MM0,
                         /* bd */ 0);
  XAieDma_TileChControl(&(ctx->TileDMAInst[11][2]), XAIEDMA_TILE_CHNUM_S2MM0,
                        XAIE_RESETDISABLE, XAIE_ENABLE);
  XAieDma_TileSetStartBd((&(ctx->TileDMAInst[11][2])), XAIEDMA_TILE_CHNUM_S2MM1,
                         /* bd */ 1);
  XAieDma_TileChControl(&(ctx->TileDMAInst[11][2]), XAIEDMA_TILE_CHNUM_S2MM1,
                        XAIE_RESETDISABLE, XAIE_ENABLE);
  XAieDma_TileInitialize(&(ctx->TileInst[11][3]), &(ctx->TileDMAInst[11][3]));
  XAieDma_TileBdClearAll(&(ctx->TileDMAInst[11][3]));
  XAieDma_TileChResetAll(&(ctx->TileDMAInst[11][3]));
  XAieDma_TileBdSetLock(&(ctx->TileDMAInst[11][3]), /* bd */ 0,
                        XAIEDMA_TILE_BD_ADDRA, /* lockID */ 0, XAIE_ENABLE,
                        /* release */ 1, XAIE_ENABLE, /* acquire */ 0);
  XAieDma_TileBdSetAdrLenMod(&(ctx->TileDMAInst[11][3]), /* bd */ 0,
                             /* addrA */ 0x2000, /* addrB */ 0x0,
                             /* len */ 1024 * 4, /* ABMode */ XAIE_DISABLE,
                             /* FIFOMode */ XAIE_DISABLE);
  XAieDma_TileBdSetNext(&(ctx->TileDMAInst[11][3]), /* bd */ 0, /* nextbd */ 0);
  XAieDma_TileBdSetPkt(&(ctx->TileDMAInst[11][3]), /* bd */ 0, /* en */ 1,
                       /* type */ 0, /* id */ 1);
  XAieDma_TileBdWrite(&(ctx->TileDMAInst[11][3]), /* bd */ 0);
  XAieDma_TileBdSetLock(&(ctx->TileDMAInst[11][3]), /* bd */ 1,
                        XAIEDMA_TILE_BD_ADDRA, /* lockID */ 2, XAIE_ENABLE,
                        /* release */ 1, XAIE_ENABLE, /* acquire */ 0);
  XAieDma_TileBdSetAdrLenMod(&(ctx->TileDMAInst[11][3]), /* bd */ 1,
                             /* addrA */ 0x3000, /* addrB */ 0x0,
                             /* len */ 1024 * 4, /* ABMode */ XAIE_DISABLE,
                             /* FIFOMode */ XAIE_DISABLE);
  XAieDma_TileBdSetNext(&(ctx->TileDMAInst[11][3]), /* bd */ 1, /* nextbd */ 1);
  XAieDma_TileBdSetPkt(&(ctx->TileDMAInst[11][3]), /* bd */ 1, /* en */ 1,
                       /* type */ 0, /* id */ 5);
  XAieDma_TileBdWrite(&(ctx->TileDMAInst[11][3]), /* bd */ 1);
  XAieDma_TileSetStartBd((&(ctx->TileDMAInst[11][3])), XAIEDMA_TILE_CHNUM_S2MM0,
                         /* bd */ 0);
  XAieDma_TileChControl(&(ctx->TileDMAInst[11][3]), XAIEDMA_TILE_CHNUM_S2MM0,
                        XAIE_RESETDISABLE, XAIE_ENABLE);
  XAieDma_TileSetStartBd((&(ctx->TileDMAInst[11][3])), XAIEDMA_TILE_CHNUM_S2MM1,
                         /* bd */ 1);
  XAieDma_TileChControl(&(ctx->TileDMAInst[11][3]), XAIEDMA_TILE_CHNUM_S2MM1,
                        XAIE_RESETDISABLE, XAIE_ENABLE);
  XAieDma_TileInitialize(&(ctx->TileInst[11][4]), &(ctx->TileDMAInst[11][4]));
  XAieDma_TileBdClearAll(&(ctx->TileDMAInst[11][4]));
  XAieDma_TileChResetAll(&(ctx->TileDMAInst[11][4]));
  XAieDma_TileBdSetLock(&(ctx->TileDMAInst[11][4]), /* bd */ 0,
                        XAIEDMA_TILE_BD_ADDRA, /* lockID */ 2, XAIE_ENABLE,
                        /* release */ 1, XAIE_ENABLE, /* acquire */ 0);
  XAieDma_TileBdSetAdrLenMod(&(ctx->TileDMAInst[11][4]), /* bd */ 0,
                             /* addrA */ 0x2000, /* addrB */ 0x0,
                             /* len */ 1024 * 4, /* ABMode */ XAIE_DISABLE,
                             /* FIFOMode */ XAIE_DISABLE);
  XAieDma_TileBdSetNext(&(ctx->TileDMAInst[11][4]), /* bd */ 0, /* nextbd */ 0);
  XAieDma_TileBdSetPkt(&(ctx->TileDMAInst[11][4]), /* bd */ 0, /* en */ 1,
                       /* type */ 0, /* id */ 2);
  XAieDma_TileBdWrite(&(ctx->TileDMAInst[11][4]), /* bd */ 0);
  XAieDma_TileBdSetLock(&(ctx->TileDMAInst[11][4]), /* bd */ 1,
                        XAIEDMA_TILE_BD_ADDRA, /* lockID */ 1, XAIE_ENABLE,
                        /* release */ 1, XAIE_ENABLE, /* acquire */ 0);
  XAieDma_TileBdSetAdrLenMod(&(ctx->TileDMAInst[11][4]), /* bd */ 1,
                             /* addrA */ 0x3000, /* addrB */ 0x0,
                             /* len */ 1024 * 4, /* ABMode */ XAIE_DISABLE,
                             /* FIFOMode */ XAIE_DISABLE);
  XAieDma_TileBdSetNext(&(ctx->TileDMAInst[11][4]), /* bd */ 1, /* nextbd */ 1);
  XAieDma_TileBdSetPkt(&(ctx->TileDMAInst[11][4]), /* bd */ 1, /* en */ 1,
                       /* type */ 0, /* id */ 6);
  XAieDma_TileBdWrite(&(ctx->TileDMAInst[11][4]), /* bd */ 1);
  XAieDma_TileBdSetLock(&(ctx->TileDMAInst[11][4]), /* bd */ 2,
                        XAIEDMA_TILE_BD_ADDRA, /* lockID */ 0, XAIE_ENABLE,
                        /* release */ 0, XAIE_ENABLE, /* acquire */ 1);
  XAieDma_TileBdSetAdrLenMod(&(ctx->TileDMAInst[11][4]), /* bd */ 2,
                             /* addrA */ 0x1000, /* addrB */ 0x0,
                             /* len */ 1024 * 4, /* ABMode */ XAIE_DISABLE,
                             /* FIFOMode */ XAIE_DISABLE);
  XAieDma_TileBdSetNext(&(ctx->TileDMAInst[11][4]), /* bd */ 2, /* nextbd */ 2);
  XAieDma_TileBdSetPkt(&(ctx->TileDMAInst[11][4]), /* bd */ 2, /* en */ 1,
                       /* type */ 0, /* id */ 1);
  XAieDma_TileBdWrite(&(ctx->TileDMAInst[11][4]), /* bd */ 2);
  XAieDma_TileSetStartBd((&(ctx->TileDMAInst[11][4])), XAIEDMA_TILE_CHNUM_S2MM0,
                         /* bd */ 0);
  XAieDma_TileChControl(&(ctx->TileDMAInst[11][4]), XAIEDMA_TILE_CHNUM_S2MM0,
                        XAIE_RESETDISABLE, XAIE_ENABLE);
  XAieDma_TileSetStartBd((&(ctx->TileDMAInst[11][4])), XAIEDMA_TILE_CHNUM_S2MM1,
                         /* bd */ 1);
  XAieDma_TileChControl(&(ctx->TileDMAInst[11][4]), XAIEDMA_TILE_CHNUM_S2MM1,
                        XAIE_RESETDISABLE, XAIE_ENABLE);
  XAieDma_TileSetStartBd((&(ctx->TileDMAInst[11][4])), XAIEDMA_TILE_CHNUM_MM2S0,
                         /* bd */ 2);
  XAieDma_TileChControl(&(ctx->TileDMAInst[11][4]), XAIEDMA_TILE_CHNUM_MM2S0,
                        XAIE_RESETDISABLE, XAIE_ENABLE);
  XAieDma_TileInitialize(&(ctx->TileInst[12][2]), &(ctx->TileDMAInst[12][2]));
  XAieDma_TileBdClearAll(&(ctx->TileDMAInst[12][2]));
  XAieDma_TileChResetAll(&(ctx->TileDMAInst[12][2]));
  XAieDma_TileBdSetLock(&(ctx->TileDMAInst[12][2]), /* bd */ 0,
                        XAIEDMA_TILE_BD_ADDRA, /* lockID */ 0, XAIE_ENABLE,
                        /* release */ 1, XAIE_ENABLE, /* acquire */ 0);
  XAieDma_TileBdSetAdrLenMod(&(ctx->TileDMAInst[12][2]), /* bd */ 0,
                             /* addrA */ 0x3000, /* addrB */ 0x0,
                             /* len */ 1024 * 4, /* ABMode */ XAIE_DISABLE,
                             /* FIFOMode */ XAIE_DISABLE);
  XAieDma_TileBdSetNext(&(ctx->TileDMAInst[12][2]), /* bd */ 0, /* nextbd */ 0);
  XAieDma_TileBdSetPkt(&(ctx->TileDMAInst[12][2]), /* bd */ 0, /* en */ 1,
                       /* type */ 0, /* id */ 4);
  XAieDma_TileBdWrite(&(ctx->TileDMAInst[12][2]), /* bd */ 0);
  XAieDma_TileBdSetLock(&(ctx->TileDMAInst[12][2]), /* bd */ 1,
                        XAIEDMA_TILE_BD_ADDRA, /* lockID */ 1, XAIE_ENABLE,
                        /* release */ 1, XAIE_ENABLE, /* acquire */ 0);
  XAieDma_TileBdSetAdrLenMod(&(ctx->TileDMAInst[12][2]), /* bd */ 1,
                             /* addrA */ 0x2000, /* addrB */ 0x0,
                             /* len */ 1024 * 4, /* ABMode */ XAIE_DISABLE,
                             /* FIFOMode */ XAIE_DISABLE);
  XAieDma_TileBdSetNext(&(ctx->TileDMAInst[12][2]), /* bd */ 1, /* nextbd */ 1);
  XAieDma_TileBdSetPkt(&(ctx->TileDMAInst[12][2]), /* bd */ 1, /* en */ 1,
                       /* type */ 0, /* id */ 0);
  XAieDma_TileBdWrite(&(ctx->TileDMAInst[12][2]), /* bd */ 1);
  XAieDma_TileSetStartBd((&(ctx->TileDMAInst[12][2])), XAIEDMA_TILE_CHNUM_S2MM0,
                         /* bd */ 0);
  XAieDma_TileChControl(&(ctx->TileDMAInst[12][2]), XAIEDMA_TILE_CHNUM_S2MM0,
                        XAIE_RESETDISABLE, XAIE_ENABLE);
  XAieDma_TileSetStartBd((&(ctx->TileDMAInst[12][2])), XAIEDMA_TILE_CHNUM_S2MM1,
                         /* bd */ 1);
  XAieDma_TileChControl(&(ctx->TileDMAInst[12][2]), XAIEDMA_TILE_CHNUM_S2MM1,
                        XAIE_RESETDISABLE, XAIE_ENABLE);
  XAieDma_TileInitialize(&(ctx->TileInst[12][3]), &(ctx->TileDMAInst[12][3]));
  XAieDma_TileBdClearAll(&(ctx->TileDMAInst[12][3]));
  XAieDma_TileChResetAll(&(ctx->TileDMAInst[12][3]));
  XAieDma_TileBdSetLock(&(ctx->TileDMAInst[12][3]), /* bd */ 0,
                        XAIEDMA_TILE_BD_ADDRA, /* lockID */ 1, XAIE_ENABLE,
                        /* release */ 1, XAIE_ENABLE, /* acquire */ 0);
  XAieDma_TileBdSetAdrLenMod(&(ctx->TileDMAInst[12][3]), /* bd */ 0,
                             /* addrA */ 0x2000, /* addrB */ 0x0,
                             /* len */ 1024 * 4, /* ABMode */ XAIE_DISABLE,
                             /* FIFOMode */ XAIE_DISABLE);
  XAieDma_TileBdSetNext(&(ctx->TileDMAInst[12][3]), /* bd */ 0, /* nextbd */ 0);
  XAieDma_TileBdSetPkt(&(ctx->TileDMAInst[12][3]), /* bd */ 0, /* en */ 1,
                       /* type */ 0, /* id */ 1);
  XAieDma_TileBdWrite(&(ctx->TileDMAInst[12][3]), /* bd */ 0);
  XAieDma_TileBdSetLock(&(ctx->TileDMAInst[12][3]), /* bd */ 1,
                        XAIEDMA_TILE_BD_ADDRA, /* lockID */ 2, XAIE_ENABLE,
                        /* release */ 1, XAIE_ENABLE, /* acquire */ 0);
  XAieDma_TileBdSetAdrLenMod(&(ctx->TileDMAInst[12][3]), /* bd */ 1,
                             /* addrA */ 0x3000, /* addrB */ 0x0,
                             /* len */ 1024 * 4, /* ABMode */ XAIE_DISABLE,
                             /* FIFOMode */ XAIE_DISABLE);
  XAieDma_TileBdSetNext(&(ctx->TileDMAInst[12][3]), /* bd */ 1, /* nextbd */ 1);
  XAieDma_TileBdSetPkt(&(ctx->TileDMAInst[12][3]), /* bd */ 1, /* en */ 1,
                       /* type */ 0, /* id */ 5);
  XAieDma_TileBdWrite(&(ctx->TileDMAInst[12][3]), /* bd */ 1);
  XAieDma_TileSetStartBd((&(ctx->TileDMAInst[12][3])), XAIEDMA_TILE_CHNUM_S2MM0,
                         /* bd */ 0);
  XAieDma_TileChControl(&(ctx->TileDMAInst[12][3]), XAIEDMA_TILE_CHNUM_S2MM0,
                        XAIE_RESETDISABLE, XAIE_ENABLE);
  XAieDma_TileSetStartBd((&(ctx->TileDMAInst[12][3])), XAIEDMA_TILE_CHNUM_S2MM1,
                         /* bd */ 1);
  XAieDma_TileChControl(&(ctx->TileDMAInst[12][3]), XAIEDMA_TILE_CHNUM_S2MM1,
                        XAIE_RESETDISABLE, XAIE_ENABLE);
  XAieDma_TileInitialize(&(ctx->TileInst[12][4]), &(ctx->TileDMAInst[12][4]));
  XAieDma_TileBdClearAll(&(ctx->TileDMAInst[12][4]));
  XAieDma_TileChResetAll(&(ctx->TileDMAInst[12][4]));
  XAieDma_TileBdSetLock(&(ctx->TileDMAInst[12][4]), /* bd */ 0,
                        XAIEDMA_TILE_BD_ADDRA, /* lockID */ 0, XAIE_ENABLE,
                        /* release */ 1, XAIE_ENABLE, /* acquire */ 0);
  XAieDma_TileBdSetAdrLenMod(&(ctx->TileDMAInst[12][4]), /* bd */ 0,
                             /* addrA */ 0x3000, /* addrB */ 0x0,
                             /* len */ 1024 * 4, /* ABMode */ XAIE_DISABLE,
                             /* FIFOMode */ XAIE_DISABLE);
  XAieDma_TileBdSetNext(&(ctx->TileDMAInst[12][4]), /* bd */ 0, /* nextbd */ 0);
  XAieDma_TileBdSetPkt(&(ctx->TileDMAInst[12][4]), /* bd */ 0, /* en */ 1,
                       /* type */ 0, /* id */ 6);
  XAieDma_TileBdWrite(&(ctx->TileDMAInst[12][4]), /* bd */ 0);
  XAieDma_TileBdSetLock(&(ctx->TileDMAInst[12][4]), /* bd */ 1,
                        XAIEDMA_TILE_BD_ADDRA, /* lockID */ 2, XAIE_ENABLE,
                        /* release */ 1, XAIE_ENABLE, /* acquire */ 0);
  XAieDma_TileBdSetAdrLenMod(&(ctx->TileDMAInst[12][4]), /* bd */ 1,
                             /* addrA */ 0x2000, /* addrB */ 0x0,
                             /* len */ 1024 * 4, /* ABMode */ XAIE_DISABLE,
                             /* FIFOMode */ XAIE_DISABLE);
  XAieDma_TileBdSetNext(&(ctx->TileDMAInst[12][4]), /* bd */ 1, /* nextbd */ 1);
  XAieDma_TileBdSetPkt(&(ctx->TileDMAInst[12][4]), /* bd */ 1, /* en */ 1,
                       /* type */ 0, /* id */ 2);
  XAieDma_TileBdWrite(&(ctx->TileDMAInst[12][4]), /* bd */ 1);
  XAieDma_TileBdSetLock(&(ctx->TileDMAInst[12][4]), /* bd */ 2,
                        XAIEDMA_TILE_BD_ADDRA, /* lockID */ 1, XAIE_ENABLE,
                        /* release */ 0, XAIE_ENABLE, /* acquire */ 1);
  XAieDma_TileBdSetAdrLenMod(&(ctx->TileDMAInst[12][4]), /* bd */ 2,
                             /* addrA */ 0x1000, /* addrB */ 0x0,
                             /* len */ 1024 * 4, /* ABMode */ XAIE_DISABLE,
                             /* FIFOMode */ XAIE_DISABLE);
  XAieDma_TileBdSetNext(&(ctx->TileDMAInst[12][4]), /* bd */ 2, /* nextbd */ 2);
  XAieDma_TileBdSetPkt(&(ctx->TileDMAInst[12][4]), /* bd */ 2, /* en */ 1,
                       /* type */ 0, /* id */ 2);
  XAieDma_TileBdWrite(&(ctx->TileDMAInst[12][4]), /* bd */ 2);
  XAieDma_TileSetStartBd((&(ctx->TileDMAInst[12][4])), XAIEDMA_TILE_CHNUM_S2MM0,
                         /* bd */ 0);
  XAieDma_TileChControl(&(ctx->TileDMAInst[12][4]), XAIEDMA_TILE_CHNUM_S2MM0,
                        XAIE_RESETDISABLE, XAIE_ENABLE);
  XAieDma_TileSetStartBd((&(ctx->TileDMAInst[12][4])), XAIEDMA_TILE_CHNUM_S2MM1,
                         /* bd */ 1);
  XAieDma_TileChControl(&(ctx->TileDMAInst[12][4]), XAIEDMA_TILE_CHNUM_S2MM1,
                        XAIE_RESETDISABLE, XAIE_ENABLE);
  XAieDma_TileSetStartBd((&(ctx->TileDMAInst[12][4])), XAIEDMA_TILE_CHNUM_MM2S0,
                         /* bd */ 2);
  XAieDma_TileChControl(&(ctx->TileDMAInst[12][4]), XAIEDMA_TILE_CHNUM_MM2S0,
                        XAIE_RESETDISABLE, XAIE_ENABLE);
  XAieDma_Shim ShimDMAInst_10_0;
  XAieDma_ShimInitialize(&(ctx->TileInst[10][0]), &ShimDMAInst_10_0);
  XAieDma_ShimBdClearAll(&ShimDMAInst_10_0);
  XAieDma_ShimChResetAll(&ShimDMAInst_10_0);
  XAieDma_ShimBdSetLock(&ShimDMAInst_10_0, /* bd */ 0, /* lockID */ 4,
                        XAIE_ENABLE, /* release */ 0, XAIE_ENABLE,
                        /* acquire */ 1);
  XAieDma_ShimBdSetAddr(&ShimDMAInst_10_0, /* bd */ 0, HIGH_ADDR((u64)0x8000),
                        LOW_ADDR((u64)0x8000), /* len */ 1024 * 4);
  XAieDma_ShimBdSetAxi(&ShimDMAInst_10_0, /* bd */ 0, /* smid */ 0,
                       /* burstlen */ 4, /* QOS */ 0, /* Cache */ 0,
                       /* secure */ XAIE_ENABLE);
  XAieDma_ShimBdSetNext(&ShimDMAInst_10_0, /* bd */ 0, /* nextbd */ 1);
  XAieDma_ShimBdSetPkt(&ShimDMAInst_10_0, /* bd */ 0, /* en */ 1, /* type */ 0,
                       /* id */ 0);
  XAieDma_ShimBdWrite(&ShimDMAInst_10_0, /* bd */ 0);
  XAieDma_ShimBdSetLock(&ShimDMAInst_10_0, /* bd */ 1, /* lockID */ 3,
                        XAIE_ENABLE, /* release */ 0, XAIE_ENABLE,
                        /* acquire */ 1);
  XAieDma_ShimBdSetAddr(&ShimDMAInst_10_0, /* bd */ 1, HIGH_ADDR((u64)0x6000),
                        LOW_ADDR((u64)0x6000), /* len */ 1024 * 4);
  XAieDma_ShimBdSetAxi(&ShimDMAInst_10_0, /* bd */ 1, /* smid */ 0,
                       /* burstlen */ 4, /* QOS */ 0, /* Cache */ 0,
                       /* secure */ XAIE_ENABLE);
  XAieDma_ShimBdSetNext(&ShimDMAInst_10_0, /* bd */ 1, /* nextbd */ 2);
  XAieDma_ShimBdSetPkt(&ShimDMAInst_10_0, /* bd */ 1, /* en */ 1, /* type */ 0,
                       /* id */ 1);
  XAieDma_ShimBdWrite(&ShimDMAInst_10_0, /* bd */ 1);
  XAieDma_ShimBdSetLock(&ShimDMAInst_10_0, /* bd */ 2, /* lockID */ 2,
                        XAIE_ENABLE, /* release */ 0, XAIE_ENABLE,
                        /* acquire */ 1);
  XAieDma_ShimBdSetAddr(&ShimDMAInst_10_0, /* bd */ 2, HIGH_ADDR((u64)0x4000),
                        LOW_ADDR((u64)0x4000), /* len */ 1024 * 4);
  XAieDma_ShimBdSetAxi(&ShimDMAInst_10_0, /* bd */ 2, /* smid */ 0,
                       /* burstlen */ 4, /* QOS */ 0, /* Cache */ 0,
                       /* secure */ XAIE_ENABLE);
  XAieDma_ShimBdSetNext(&ShimDMAInst_10_0, /* bd */ 2, /* nextbd */ 0);
  XAieDma_ShimBdSetPkt(&ShimDMAInst_10_0, /* bd */ 2, /* en */ 1, /* type */ 0,
                       /* id */ 2);
  XAieDma_ShimBdWrite(&ShimDMAInst_10_0, /* bd */ 2);
  XAieDma_ShimBdSetLock(&ShimDMAInst_10_0, /* bd */ 3, /* lockID */ 5,
                        XAIE_ENABLE, /* release */ 0, XAIE_ENABLE,
                        /* acquire */ 1);
  XAieDma_ShimBdSetAddr(&ShimDMAInst_10_0, /* bd */ 3, HIGH_ADDR((u64)0x9000),
                        LOW_ADDR((u64)0x9000), /* len */ 1024 * 4);
  XAieDma_ShimBdSetAxi(&ShimDMAInst_10_0, /* bd */ 3, /* smid */ 0,
                       /* burstlen */ 4, /* QOS */ 0, /* Cache */ 0,
                       /* secure */ XAIE_ENABLE);
  XAieDma_ShimBdSetNext(&ShimDMAInst_10_0, /* bd */ 3, /* nextbd */ 4);
  XAieDma_ShimBdSetPkt(&ShimDMAInst_10_0, /* bd */ 3, /* en */ 1, /* type */ 0,
                       /* id */ 4);
  XAieDma_ShimBdWrite(&ShimDMAInst_10_0, /* bd */ 3);
  XAieDma_ShimBdSetLock(&ShimDMAInst_10_0, /* bd */ 4, /* lockID */ 0,
                        XAIE_ENABLE, /* release */ 0, XAIE_ENABLE,
                        /* acquire */ 1);
  XAieDma_ShimBdSetAddr(&ShimDMAInst_10_0, /* bd */ 4, HIGH_ADDR((u64)0x7000),
                        LOW_ADDR((u64)0x7000), /* len */ 1024 * 4);
  XAieDma_ShimBdSetAxi(&ShimDMAInst_10_0, /* bd */ 4, /* smid */ 0,
                       /* burstlen */ 4, /* QOS */ 0, /* Cache */ 0,
                       /* secure */ XAIE_ENABLE);
  XAieDma_ShimBdSetNext(&ShimDMAInst_10_0, /* bd */ 4, /* nextbd */ 5);
  XAieDma_ShimBdSetPkt(&ShimDMAInst_10_0, /* bd */ 4, /* en */ 1, /* type */ 0,
                       /* id */ 5);
  XAieDma_ShimBdWrite(&ShimDMAInst_10_0, /* bd */ 4);
  XAieDma_ShimBdSetLock(&ShimDMAInst_10_0, /* bd */ 5, /* lockID */ 1,
                        XAIE_ENABLE, /* release */ 0, XAIE_ENABLE,
                        /* acquire */ 1);
  XAieDma_ShimBdSetAddr(&ShimDMAInst_10_0, /* bd */ 5, HIGH_ADDR((u64)0x5000),
                        LOW_ADDR((u64)0x5000), /* len */ 1024 * 4);
  XAieDma_ShimBdSetAxi(&ShimDMAInst_10_0, /* bd */ 5, /* smid */ 0,
                       /* burstlen */ 4, /* QOS */ 0, /* Cache */ 0,
                       /* secure */ XAIE_ENABLE);
  XAieDma_ShimBdSetNext(&ShimDMAInst_10_0, /* bd */ 5, /* nextbd */ 3);
  XAieDma_ShimBdSetPkt(&ShimDMAInst_10_0, /* bd */ 5, /* en */ 1, /* type */ 0,
                       /* id */ 6);
  XAieDma_ShimBdWrite(&ShimDMAInst_10_0, /* bd */ 5);
  XAieDma_ShimSetStartBd(&ShimDMAInst_10_0, XAIEDMA_SHIM_CHNUM_MM2S0,
                         /* bd */ 0);
  XAieDma_ShimChControl(&ShimDMAInst_10_0, XAIEDMA_TILE_CHNUM_MM2S0,
                        /* PauseStream */ XAIE_DISABLE,
                        /* PauseMM */ XAIE_DISABLE, /* Enable */ XAIE_ENABLE);
  XAieDma_ShimSetStartBd(&ShimDMAInst_10_0, XAIEDMA_SHIM_CHNUM_MM2S1,
                         /* bd */ 3);
  XAieDma_ShimChControl(&ShimDMAInst_10_0, XAIEDMA_TILE_CHNUM_MM2S1,
                        /* PauseStream */ XAIE_DISABLE,
                        /* PauseMM */ XAIE_DISABLE, /* Enable */ XAIE_ENABLE);
  XAieDma_Shim ShimDMAInst_11_0;
  XAieDma_ShimInitialize(&(ctx->TileInst[11][0]), &ShimDMAInst_11_0);
  XAieDma_ShimBdClearAll(&ShimDMAInst_11_0);
  XAieDma_ShimChResetAll(&ShimDMAInst_11_0);
  XAieDma_ShimBdSetAddr(&ShimDMAInst_11_0, /* bd */ 0, HIGH_ADDR((u64)0x10000),
                        LOW_ADDR((u64)0x10000), /* len */ 1025 * 4);
  XAieDma_ShimBdSetAxi(&ShimDMAInst_11_0, /* bd */ 0, /* smid */ 0,
                       /* burstlen */ 4, /* QOS */ 0, /* Cache */ 0,
                       /* secure */ XAIE_ENABLE);
  XAieDma_ShimBdSetNext(&ShimDMAInst_11_0, /* bd */ 0, /* nextbd */ 1);
  XAieDma_ShimBdSetPkt(&ShimDMAInst_11_0, /* bd */ 0, /* en */ 1, /* type */ 0,
                       /* id */ 0);
  XAieDma_ShimBdWrite(&ShimDMAInst_11_0, /* bd */ 0);
  XAieDma_ShimBdSetAddr(&ShimDMAInst_11_0, /* bd */ 1, HIGH_ADDR((u64)0x12000),
                        LOW_ADDR((u64)0x12000), /* len */ 1025 * 4);
  XAieDma_ShimBdSetAxi(&ShimDMAInst_11_0, /* bd */ 1, /* smid */ 0,
                       /* burstlen */ 4, /* QOS */ 0, /* Cache */ 0,
                       /* secure */ XAIE_ENABLE);
  XAieDma_ShimBdSetNext(&ShimDMAInst_11_0, /* bd */ 1, /* nextbd */ 2);
  XAieDma_ShimBdSetPkt(&ShimDMAInst_11_0, /* bd */ 1, /* en */ 1, /* type */ 0,
                       /* id */ 1);
  XAieDma_ShimBdWrite(&ShimDMAInst_11_0, /* bd */ 1);
  XAieDma_ShimBdSetAddr(&ShimDMAInst_11_0, /* bd */ 2, HIGH_ADDR((u64)0x14000),
                        LOW_ADDR((u64)0x14000), /* len */ 1025 * 4);
  XAieDma_ShimBdSetAxi(&ShimDMAInst_11_0, /* bd */ 2, /* smid */ 0,
                       /* burstlen */ 4, /* QOS */ 0, /* Cache */ 0,
                       /* secure */ XAIE_ENABLE);
  XAieDma_ShimBdSetNext(&ShimDMAInst_11_0, /* bd */ 2, /* nextbd */ 0);
  XAieDma_ShimBdSetPkt(&ShimDMAInst_11_0, /* bd */ 2, /* en */ 1, /* type */ 0,
                       /* id */ 2);
  XAieDma_ShimBdWrite(&ShimDMAInst_11_0, /* bd */ 2);
  XAieDma_ShimBdSetLock(&ShimDMAInst_11_0, /* bd */ 3, /* lockID */ 2,
                        XAIE_ENABLE, /* release */ 0, XAIE_ENABLE,
                        /* acquire */ 1);
  XAieDma_ShimBdSetAddr(&ShimDMAInst_11_0, /* bd */ 3, HIGH_ADDR((u64)0xF000),
                        LOW_ADDR((u64)0xF000), /* len */ 1024 * 4);
  XAieDma_ShimBdSetAxi(&ShimDMAInst_11_0, /* bd */ 3, /* smid */ 0,
                       /* burstlen */ 4, /* QOS */ 0, /* Cache */ 0,
                       /* secure */ XAIE_ENABLE);
  XAieDma_ShimBdSetNext(&ShimDMAInst_11_0, /* bd */ 3, /* nextbd */ 4);
  XAieDma_ShimBdSetPkt(&ShimDMAInst_11_0, /* bd */ 3, /* en */ 1, /* type */ 0,
                       /* id */ 4);
  XAieDma_ShimBdWrite(&ShimDMAInst_11_0, /* bd */ 3);
  XAieDma_ShimBdSetLock(&ShimDMAInst_11_0, /* bd */ 4, /* lockID */ 4,
                        XAIE_ENABLE, /* release */ 0, XAIE_ENABLE,
                        /* acquire */ 1);
  XAieDma_ShimBdSetAddr(&ShimDMAInst_11_0, /* bd */ 4, HIGH_ADDR((u64)0xE000),
                        LOW_ADDR((u64)0xE000), /* len */ 1024 * 4);
  XAieDma_ShimBdSetAxi(&ShimDMAInst_11_0, /* bd */ 4, /* smid */ 0,
                       /* burstlen */ 4, /* QOS */ 0, /* Cache */ 0,
                       /* secure */ XAIE_ENABLE);
  XAieDma_ShimBdSetNext(&ShimDMAInst_11_0, /* bd */ 4, /* nextbd */ 5);
  XAieDma_ShimBdSetPkt(&ShimDMAInst_11_0, /* bd */ 4, /* en */ 1, /* type */ 0,
                       /* id */ 5);
  XAieDma_ShimBdWrite(&ShimDMAInst_11_0, /* bd */ 4);
  XAieDma_ShimBdSetLock(&ShimDMAInst_11_0, /* bd */ 5, /* lockID */ 1,
                        XAIE_ENABLE, /* release */ 0, XAIE_ENABLE,
                        /* acquire */ 1);
  XAieDma_ShimBdSetAddr(&ShimDMAInst_11_0, /* bd */ 5, HIGH_ADDR((u64)0xD000),
                        LOW_ADDR((u64)0xD000), /* len */ 1024 * 4);
  XAieDma_ShimBdSetAxi(&ShimDMAInst_11_0, /* bd */ 5, /* smid */ 0,
                       /* burstlen */ 4, /* QOS */ 0, /* Cache */ 0,
                       /* secure */ XAIE_ENABLE);
  XAieDma_ShimBdSetNext(&ShimDMAInst_11_0, /* bd */ 5, /* nextbd */ 3);
  XAieDma_ShimBdSetPkt(&ShimDMAInst_11_0, /* bd */ 5, /* en */ 1, /* type */ 0,
                       /* id */ 6);
  XAieDma_ShimBdWrite(&ShimDMAInst_11_0, /* bd */ 5);
  XAieDma_ShimBdSetLock(&ShimDMAInst_11_0, /* bd */ 6, /* lockID */ 3,
                        XAIE_ENABLE, /* release */ 0, XAIE_ENABLE,
                        /* acquire */ 1);
  XAieDma_ShimBdSetAddr(&ShimDMAInst_11_0, /* bd */ 6, HIGH_ADDR((u64)0xC000),
                        LOW_ADDR((u64)0xC000), /* len */ 1024 * 4);
  XAieDma_ShimBdSetAxi(&ShimDMAInst_11_0, /* bd */ 6, /* smid */ 0,
                       /* burstlen */ 4, /* QOS */ 0, /* Cache */ 0,
                       /* secure */ XAIE_ENABLE);
  XAieDma_ShimBdSetNext(&ShimDMAInst_11_0, /* bd */ 6, /* nextbd */ 7);
  XAieDma_ShimBdSetPkt(&ShimDMAInst_11_0, /* bd */ 6, /* en */ 1, /* type */ 0,
                       /* id */ 4);
  XAieDma_ShimBdWrite(&ShimDMAInst_11_0, /* bd */ 6);
  XAieDma_ShimBdSetLock(&ShimDMAInst_11_0, /* bd */ 7, /* lockID */ 5,
                        XAIE_ENABLE, /* release */ 0, XAIE_ENABLE,
                        /* acquire */ 1);
  XAieDma_ShimBdSetAddr(&ShimDMAInst_11_0, /* bd */ 7, HIGH_ADDR((u64)0xB000),
                        LOW_ADDR((u64)0xB000), /* len */ 1024 * 4);
  XAieDma_ShimBdSetAxi(&ShimDMAInst_11_0, /* bd */ 7, /* smid */ 0,
                       /* burstlen */ 4, /* QOS */ 0, /* Cache */ 0,
                       /* secure */ XAIE_ENABLE);
  XAieDma_ShimBdSetNext(&ShimDMAInst_11_0, /* bd */ 7, /* nextbd */ 8);
  XAieDma_ShimBdSetPkt(&ShimDMAInst_11_0, /* bd */ 7, /* en */ 1, /* type */ 0,
                       /* id */ 5);
  XAieDma_ShimBdWrite(&ShimDMAInst_11_0, /* bd */ 7);
  XAieDma_ShimBdSetLock(&ShimDMAInst_11_0, /* bd */ 8, /* lockID */ 0,
                        XAIE_ENABLE, /* release */ 0, XAIE_ENABLE,
                        /* acquire */ 1);
  XAieDma_ShimBdSetAddr(&ShimDMAInst_11_0, /* bd */ 8, HIGH_ADDR((u64)0xA000),
                        LOW_ADDR((u64)0xA000), /* len */ 1024 * 4);
  XAieDma_ShimBdSetAxi(&ShimDMAInst_11_0, /* bd */ 8, /* smid */ 0,
                       /* burstlen */ 4, /* QOS */ 0, /* Cache */ 0,
                       /* secure */ XAIE_ENABLE);
  XAieDma_ShimBdSetNext(&ShimDMAInst_11_0, /* bd */ 8, /* nextbd */ 6);
  XAieDma_ShimBdSetPkt(&ShimDMAInst_11_0, /* bd */ 8, /* en */ 1, /* type */ 0,
                       /* id */ 6);
  XAieDma_ShimBdWrite(&ShimDMAInst_11_0, /* bd */ 8);
  XAieDma_ShimSetStartBd(&ShimDMAInst_11_0, XAIEDMA_SHIM_CHNUM_S2MM0,
                         /* bd */ 0);
  XAieDma_ShimChControl(&ShimDMAInst_11_0, XAIEDMA_TILE_CHNUM_S2MM0,
                        /* PauseStream */ XAIE_DISABLE,
                        /* PauseMM */ XAIE_DISABLE, /* Enable */ XAIE_ENABLE);
  XAieDma_ShimSetStartBd(&ShimDMAInst_11_0, XAIEDMA_SHIM_CHNUM_MM2S0,
                         /* bd */ 3);
  XAieDma_ShimChControl(&ShimDMAInst_11_0, XAIEDMA_TILE_CHNUM_MM2S0,
                        /* PauseStream */ XAIE_DISABLE,
                        /* PauseMM */ XAIE_DISABLE, /* Enable */ XAIE_ENABLE);
  XAieDma_ShimSetStartBd(&ShimDMAInst_11_0, XAIEDMA_SHIM_CHNUM_MM2S1,
                         /* bd */ 6);
  XAieDma_ShimChControl(&ShimDMAInst_11_0, XAIEDMA_TILE_CHNUM_MM2S1,
                        /* PauseStream */ XAIE_DISABLE,
                        /* PauseMM */ XAIE_DISABLE, /* Enable */ XAIE_ENABLE);
} // mlir_aie_configure_dmas

void mlir_aie_initialize_locks(aie_libxaie_ctx_t *ctx) {
} // mlir_aie_initialize_locks
void mlir_aie_configure_switchboxes(aie_libxaie_ctx_t *ctx) {
  int x, y;
  // Core Stream Switch column 10 row 0
  x = 10;
  y = 0;
  XAieTile_StrmConfigMstr(
      &(ctx->TileInst[x][y]),
      XAIETILE_STRSW_MPORT_NORTH(&(ctx->TileInst[x][y]), 0), XAIE_ENABLE,
      XAIE_ENABLE,
      XAIETILE_STRSW_MPORT_CFGPKT(
          &(ctx->TileInst[x][y]),
          XAIETILE_STRSW_MPORT_NORTH(&(ctx->TileInst[x][y]), 0),
          XAIE_DISABLE /*drop_header*/, 0x2 /*mask*/, 0 /*arbiter*/));
  XAieTile_StrmConfigMstr(
      &(ctx->TileInst[x][y]),
      XAIETILE_STRSW_MPORT_NORTH(&(ctx->TileInst[x][y]), 1), XAIE_ENABLE,
      XAIE_ENABLE,
      XAIETILE_STRSW_MPORT_CFGPKT(
          &(ctx->TileInst[x][y]),
          XAIETILE_STRSW_MPORT_NORTH(&(ctx->TileInst[x][y]), 1),
          XAIE_DISABLE /*drop_header*/, 0x1 /*mask*/, 0 /*arbiter*/));
  XAieTile_StrmConfigMstr(
      &(ctx->TileInst[x][y]),
      XAIETILE_STRSW_MPORT_EAST(&(ctx->TileInst[x][y]), 0), XAIE_ENABLE,
      XAIE_ENABLE,
      XAIETILE_STRSW_MPORT_CFGPKT(
          &(ctx->TileInst[x][y]),
          XAIETILE_STRSW_MPORT_EAST(&(ctx->TileInst[x][y]), 0),
          XAIE_DISABLE /*drop_header*/, 0x1 /*mask*/, 0 /*arbiter*/));
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
          0x0 /*ID value*/, 0x1C /*mask*/, XAIE_ENABLE, 0 /*msel*/,
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
          0x4 /*ID value*/, 0x1C /*mask*/, XAIE_ENABLE, 1 /*msel*/,
          0 /*arbiter*/));
  // Core Stream Switch column 11 row 0
  x = 11;
  y = 0;
  XAieTile_StrmConfigMstr(
      &(ctx->TileInst[x][y]),
      XAIETILE_STRSW_MPORT_SOUTH(&(ctx->TileInst[x][y]), 2), XAIE_ENABLE,
      XAIE_ENABLE,
      XAIETILE_STRSW_MPORT_CFGPKT(
          &(ctx->TileInst[x][y]),
          XAIETILE_STRSW_MPORT_SOUTH(&(ctx->TileInst[x][y]), 2),
          XAIE_DISABLE /*drop_header*/, 0x1 /*mask*/, 0 /*arbiter*/));
  XAieTile_StrmConfigMstr(
      &(ctx->TileInst[x][y]),
      XAIETILE_STRSW_MPORT_NORTH(&(ctx->TileInst[x][y]), 0), XAIE_ENABLE,
      XAIE_ENABLE,
      XAIETILE_STRSW_MPORT_CFGPKT(
          &(ctx->TileInst[x][y]),
          XAIETILE_STRSW_MPORT_NORTH(&(ctx->TileInst[x][y]), 0),
          XAIE_DISABLE /*drop_header*/, 0x2 /*mask*/, 0 /*arbiter*/));
  XAieTile_StrmConfigMstr(
      &(ctx->TileInst[x][y]),
      XAIETILE_STRSW_MPORT_NORTH(&(ctx->TileInst[x][y]), 1), XAIE_ENABLE,
      XAIE_ENABLE,
      XAIETILE_STRSW_MPORT_CFGPKT(
          &(ctx->TileInst[x][y]),
          XAIETILE_STRSW_MPORT_NORTH(&(ctx->TileInst[x][y]), 1),
          XAIE_DISABLE /*drop_header*/, 0x8 /*mask*/, 0 /*arbiter*/));
  XAieTile_StrmConfigMstr(
      &(ctx->TileInst[x][y]),
      XAIETILE_STRSW_MPORT_EAST(&(ctx->TileInst[x][y]), 0), XAIE_ENABLE,
      XAIE_ENABLE,
      XAIETILE_STRSW_MPORT_CFGPKT(
          &(ctx->TileInst[x][y]),
          XAIETILE_STRSW_MPORT_EAST(&(ctx->TileInst[x][y]), 0),
          XAIE_DISABLE /*drop_header*/, 0x2 /*mask*/, 0 /*arbiter*/));
  XAieTile_StrmConfigMstr(
      &(ctx->TileInst[x][y]),
      XAIETILE_STRSW_MPORT_EAST(&(ctx->TileInst[x][y]), 1), XAIE_ENABLE,
      XAIE_ENABLE,
      XAIETILE_STRSW_MPORT_CFGPKT(
          &(ctx->TileInst[x][y]),
          XAIETILE_STRSW_MPORT_EAST(&(ctx->TileInst[x][y]), 1),
          XAIE_DISABLE /*drop_header*/, 0x4 /*mask*/, 0 /*arbiter*/));
  XAieTile_StrmConfigSlv(&(ctx->TileInst[x][y]),
                         XAIETILE_STRSW_SPORT_NORTH(&(ctx->TileInst[x][y]), 2),
                         XAIE_ENABLE, XAIE_ENABLE);
  XAieTile_StrmConfigSlvSlot(
      &(ctx->TileInst[x][y]),
      XAIETILE_STRSW_SPORT_NORTH(&(ctx->TileInst[x][y]), 2), 0 /*slot*/,
      XAIE_ENABLE,
      XAIETILE_STRSW_SLVSLOT_CFG(
          &(ctx->TileInst[x][y]),
          (XAIETILE_STRSW_SPORT_NORTH(&(ctx->TileInst[x][y]), 2)), 0 /*slot*/,
          0x2 /*ID value*/, 0x1F /*mask*/, XAIE_ENABLE, 0 /*msel*/,
          0 /*arbiter*/));
  XAieTile_StrmConfigSlv(&(ctx->TileInst[x][y]),
                         XAIETILE_STRSW_SPORT_NORTH(&(ctx->TileInst[x][y]), 1),
                         XAIE_ENABLE, XAIE_ENABLE);
  XAieTile_StrmConfigSlvSlot(
      &(ctx->TileInst[x][y]),
      XAIETILE_STRSW_SPORT_NORTH(&(ctx->TileInst[x][y]), 1), 0 /*slot*/,
      XAIE_ENABLE,
      XAIETILE_STRSW_SLVSLOT_CFG(
          &(ctx->TileInst[x][y]),
          (XAIETILE_STRSW_SPORT_NORTH(&(ctx->TileInst[x][y]), 1)), 0 /*slot*/,
          0x1 /*ID value*/, 0x1F /*mask*/, XAIE_ENABLE, 0 /*msel*/,
          0 /*arbiter*/));
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
                         XAIETILE_STRSW_SPORT_SOUTH(&(ctx->TileInst[x][y]), 3),
                         XAIE_ENABLE, XAIE_ENABLE);
  XAieTile_StrmConfigSlvSlot(
      &(ctx->TileInst[x][y]),
      XAIETILE_STRSW_SPORT_SOUTH(&(ctx->TileInst[x][y]), 3), 0 /*slot*/,
      XAIE_ENABLE,
      XAIETILE_STRSW_SLVSLOT_CFG(
          &(ctx->TileInst[x][y]),
          (XAIETILE_STRSW_SPORT_SOUTH(&(ctx->TileInst[x][y]), 3)), 0 /*slot*/,
          0x4 /*ID value*/, 0x1C /*mask*/, XAIE_ENABLE, 3 /*msel*/,
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
          0x4 /*ID value*/, 0x1C /*mask*/, XAIE_ENABLE, 2 /*msel*/,
          0 /*arbiter*/));
  XAieTile_StrmConfigSlv(&(ctx->TileInst[x][y]),
                         XAIETILE_STRSW_SPORT_WEST(&(ctx->TileInst[x][y]), 0),
                         XAIE_ENABLE, XAIE_ENABLE);
  XAieTile_StrmConfigSlvSlot(
      &(ctx->TileInst[x][y]),
      XAIETILE_STRSW_SPORT_WEST(&(ctx->TileInst[x][y]), 0), 0 /*slot*/,
      XAIE_ENABLE,
      XAIETILE_STRSW_SLVSLOT_CFG(
          &(ctx->TileInst[x][y]),
          (XAIETILE_STRSW_SPORT_WEST(&(ctx->TileInst[x][y]), 0)), 0 /*slot*/,
          0x0 /*ID value*/, 0x1C /*mask*/, XAIE_ENABLE, 1 /*msel*/,
          0 /*arbiter*/));
  // Core Stream Switch column 10 row 2
  x = 10;
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
          XAIE_ENABLE /*drop_header*/, 0x1 /*mask*/, 0 /*arbiter*/));
  XAieTile_StrmConfigMstr(
      &(ctx->TileInst[x][y]),
      XAIETILE_STRSW_MPORT_NORTH(&(ctx->TileInst[x][y]), 0), XAIE_ENABLE,
      XAIE_ENABLE,
      XAIETILE_STRSW_MPORT_CFGPKT(
          &(ctx->TileInst[x][y]),
          XAIETILE_STRSW_MPORT_NORTH(&(ctx->TileInst[x][y]), 0),
          XAIE_DISABLE /*drop_header*/, 0x8 /*mask*/, 0 /*arbiter*/));
  XAieTile_StrmConfigMstr(
      &(ctx->TileInst[x][y]),
      XAIETILE_STRSW_MPORT_NORTH(&(ctx->TileInst[x][y]), 1), XAIE_ENABLE,
      XAIE_ENABLE,
      XAIETILE_STRSW_MPORT_CFGPKT(
          &(ctx->TileInst[x][y]),
          XAIETILE_STRSW_MPORT_NORTH(&(ctx->TileInst[x][y]), 1),
          XAIE_DISABLE /*drop_header*/, 0x2 /*mask*/, 0 /*arbiter*/));
  XAieTile_StrmConfigSlv(&(ctx->TileInst[x][y]),
                         XAIETILE_STRSW_SPORT_SOUTH(&(ctx->TileInst[x][y]), 1),
                         XAIE_ENABLE, XAIE_ENABLE);
  XAieTile_StrmConfigSlvSlot(
      &(ctx->TileInst[x][y]),
      XAIETILE_STRSW_SPORT_SOUTH(&(ctx->TileInst[x][y]), 1), 0 /*slot*/,
      XAIE_ENABLE,
      XAIETILE_STRSW_SLVSLOT_CFG(
          &(ctx->TileInst[x][y]),
          (XAIETILE_STRSW_SPORT_SOUTH(&(ctx->TileInst[x][y]), 1)), 0 /*slot*/,
          0x0 /*ID value*/, 0x1F /*mask*/, XAIE_ENABLE, 0 /*msel*/,
          0 /*arbiter*/));
  XAieTile_StrmConfigSlv(&(ctx->TileInst[x][y]),
                         XAIETILE_STRSW_SPORT_SOUTH(&(ctx->TileInst[x][y]), 1),
                         XAIE_ENABLE, XAIE_ENABLE);
  XAieTile_StrmConfigSlvSlot(
      &(ctx->TileInst[x][y]),
      XAIETILE_STRSW_SPORT_SOUTH(&(ctx->TileInst[x][y]), 1), 1 /*slot*/,
      XAIE_ENABLE,
      XAIETILE_STRSW_SLVSLOT_CFG(
          &(ctx->TileInst[x][y]),
          (XAIETILE_STRSW_SPORT_SOUTH(&(ctx->TileInst[x][y]), 1)), 1 /*slot*/,
          0x0 /*ID value*/, 0x1C /*mask*/, XAIE_ENABLE, 1 /*msel*/,
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
          0x4 /*ID value*/, 0x1C /*mask*/, XAIE_ENABLE, 3 /*msel*/,
          0 /*arbiter*/));
  // Core Stream Switch column 10 row 3
  x = 10;
  y = 3;
  XAieTile_StrmConfigMstr(
      &(ctx->TileInst[x][y]),
      XAIETILE_STRSW_MPORT_DMA(&(ctx->TileInst[x][y]), 0), XAIE_ENABLE,
      XAIE_ENABLE,
      XAIETILE_STRSW_MPORT_CFGPKT(
          &(ctx->TileInst[x][y]),
          XAIETILE_STRSW_MPORT_DMA(&(ctx->TileInst[x][y]), 0),
          XAIE_ENABLE /*drop_header*/, 0x1 /*mask*/, 0 /*arbiter*/));
  XAieTile_StrmConfigMstr(
      &(ctx->TileInst[x][y]),
      XAIETILE_STRSW_MPORT_DMA(&(ctx->TileInst[x][y]), 1), XAIE_ENABLE,
      XAIE_ENABLE,
      XAIETILE_STRSW_MPORT_CFGPKT(
          &(ctx->TileInst[x][y]),
          XAIETILE_STRSW_MPORT_DMA(&(ctx->TileInst[x][y]), 1),
          XAIE_ENABLE /*drop_header*/, 0x4 /*mask*/, 0 /*arbiter*/));
  XAieTile_StrmConfigMstr(
      &(ctx->TileInst[x][y]),
      XAIETILE_STRSW_MPORT_NORTH(&(ctx->TileInst[x][y]), 0), XAIE_ENABLE,
      XAIE_ENABLE,
      XAIETILE_STRSW_MPORT_CFGPKT(
          &(ctx->TileInst[x][y]),
          XAIETILE_STRSW_MPORT_NORTH(&(ctx->TileInst[x][y]), 0),
          XAIE_DISABLE /*drop_header*/, 0x8 /*mask*/, 0 /*arbiter*/));
  XAieTile_StrmConfigMstr(
      &(ctx->TileInst[x][y]),
      XAIETILE_STRSW_MPORT_NORTH(&(ctx->TileInst[x][y]), 1), XAIE_ENABLE,
      XAIE_ENABLE,
      XAIETILE_STRSW_MPORT_CFGPKT(
          &(ctx->TileInst[x][y]),
          XAIETILE_STRSW_MPORT_NORTH(&(ctx->TileInst[x][y]), 1),
          XAIE_DISABLE /*drop_header*/, 0x2 /*mask*/, 0 /*arbiter*/));
  XAieTile_StrmConfigSlv(&(ctx->TileInst[x][y]),
                         XAIETILE_STRSW_SPORT_SOUTH(&(ctx->TileInst[x][y]), 1),
                         XAIE_ENABLE, XAIE_ENABLE);
  XAieTile_StrmConfigSlvSlot(
      &(ctx->TileInst[x][y]),
      XAIETILE_STRSW_SPORT_SOUTH(&(ctx->TileInst[x][y]), 1), 0 /*slot*/,
      XAIE_ENABLE,
      XAIETILE_STRSW_SLVSLOT_CFG(
          &(ctx->TileInst[x][y]),
          (XAIETILE_STRSW_SPORT_SOUTH(&(ctx->TileInst[x][y]), 1)), 0 /*slot*/,
          0x1 /*ID value*/, 0x1F /*mask*/, XAIE_ENABLE, 0 /*msel*/,
          0 /*arbiter*/));
  XAieTile_StrmConfigSlv(&(ctx->TileInst[x][y]),
                         XAIETILE_STRSW_SPORT_SOUTH(&(ctx->TileInst[x][y]), 1),
                         XAIE_ENABLE, XAIE_ENABLE);
  XAieTile_StrmConfigSlvSlot(
      &(ctx->TileInst[x][y]),
      XAIETILE_STRSW_SPORT_SOUTH(&(ctx->TileInst[x][y]), 1), 1 /*slot*/,
      XAIE_ENABLE,
      XAIETILE_STRSW_SLVSLOT_CFG(
          &(ctx->TileInst[x][y]),
          (XAIETILE_STRSW_SPORT_SOUTH(&(ctx->TileInst[x][y]), 1)), 1 /*slot*/,
          0x2 /*ID value*/, 0x1F /*mask*/, XAIE_ENABLE, 1 /*msel*/,
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
          0x6 /*ID value*/, 0x1F /*mask*/, XAIE_ENABLE, 3 /*msel*/,
          0 /*arbiter*/));
  // Core Stream Switch column 10 row 4
  x = 10;
  y = 4;
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
      XAIETILE_STRSW_MPORT_EAST(&(ctx->TileInst[x][y]), 0), XAIE_ENABLE,
      XAIE_ENABLE,
      XAIETILE_STRSW_MPORT_CFGPKT(
          &(ctx->TileInst[x][y]),
          XAIETILE_STRSW_MPORT_EAST(&(ctx->TileInst[x][y]), 0),
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
                         XAIETILE_STRSW_SPORT_SOUTH(&(ctx->TileInst[x][y]), 1),
                         XAIE_ENABLE, XAIE_ENABLE);
  XAieTile_StrmConfigSlvSlot(
      &(ctx->TileInst[x][y]),
      XAIETILE_STRSW_SPORT_SOUTH(&(ctx->TileInst[x][y]), 1), 0 /*slot*/,
      XAIE_ENABLE,
      XAIETILE_STRSW_SLVSLOT_CFG(
          &(ctx->TileInst[x][y]),
          (XAIETILE_STRSW_SPORT_SOUTH(&(ctx->TileInst[x][y]), 1)), 0 /*slot*/,
          0x2 /*ID value*/, 0x1F /*mask*/, XAIE_ENABLE, 0 /*msel*/,
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
          0x6 /*ID value*/, 0x1F /*mask*/, XAIE_ENABLE, 2 /*msel*/,
          0 /*arbiter*/));
  // Core Stream Switch column 11 row 2
  x = 11;
  y = 2;
  XAieTile_StrmConfigMstr(
      &(ctx->TileInst[x][y]),
      XAIETILE_STRSW_MPORT_DMA(&(ctx->TileInst[x][y]), 0), XAIE_ENABLE,
      XAIE_ENABLE,
      XAIETILE_STRSW_MPORT_CFGPKT(
          &(ctx->TileInst[x][y]),
          XAIETILE_STRSW_MPORT_DMA(&(ctx->TileInst[x][y]), 0),
          XAIE_ENABLE /*drop_header*/, 0x2 /*mask*/, 0 /*arbiter*/));
  XAieTile_StrmConfigMstr(
      &(ctx->TileInst[x][y]),
      XAIETILE_STRSW_MPORT_DMA(&(ctx->TileInst[x][y]), 1), XAIE_ENABLE,
      XAIE_ENABLE,
      XAIETILE_STRSW_MPORT_CFGPKT(
          &(ctx->TileInst[x][y]),
          XAIETILE_STRSW_MPORT_DMA(&(ctx->TileInst[x][y]), 1),
          XAIE_ENABLE /*drop_header*/, 0x4 /*mask*/, 0 /*arbiter*/));
  XAieTile_StrmConfigMstr(
      &(ctx->TileInst[x][y]),
      XAIETILE_STRSW_MPORT_SOUTH(&(ctx->TileInst[x][y]), 0), XAIE_ENABLE,
      XAIE_ENABLE,
      XAIETILE_STRSW_MPORT_CFGPKT(
          &(ctx->TileInst[x][y]),
          XAIETILE_STRSW_MPORT_SOUTH(&(ctx->TileInst[x][y]), 0),
          XAIE_DISABLE /*drop_header*/, 0x4 /*mask*/, 1 /*arbiter*/));
  XAieTile_StrmConfigMstr(
      &(ctx->TileInst[x][y]),
      XAIETILE_STRSW_MPORT_SOUTH(&(ctx->TileInst[x][y]), 1), XAIE_ENABLE,
      XAIE_ENABLE,
      XAIETILE_STRSW_MPORT_CFGPKT(
          &(ctx->TileInst[x][y]),
          XAIETILE_STRSW_MPORT_SOUTH(&(ctx->TileInst[x][y]), 1),
          XAIE_DISABLE /*drop_header*/, 0x1 /*mask*/, 1 /*arbiter*/));
  XAieTile_StrmConfigMstr(
      &(ctx->TileInst[x][y]),
      XAIETILE_STRSW_MPORT_SOUTH(&(ctx->TileInst[x][y]), 2), XAIE_ENABLE,
      XAIE_ENABLE,
      XAIETILE_STRSW_MPORT_CFGPKT(
          &(ctx->TileInst[x][y]),
          XAIETILE_STRSW_MPORT_SOUTH(&(ctx->TileInst[x][y]), 2),
          XAIE_DISABLE /*drop_header*/, 0x2 /*mask*/, 1 /*arbiter*/));
  XAieTile_StrmConfigMstr(
      &(ctx->TileInst[x][y]),
      XAIETILE_STRSW_MPORT_NORTH(&(ctx->TileInst[x][y]), 0), XAIE_ENABLE,
      XAIE_ENABLE,
      XAIETILE_STRSW_MPORT_CFGPKT(
          &(ctx->TileInst[x][y]),
          XAIETILE_STRSW_MPORT_NORTH(&(ctx->TileInst[x][y]), 0),
          XAIE_DISABLE /*drop_header*/, 0x1 /*mask*/, 0 /*arbiter*/));
  XAieTile_StrmConfigMstr(
      &(ctx->TileInst[x][y]),
      XAIETILE_STRSW_MPORT_NORTH(&(ctx->TileInst[x][y]), 1), XAIE_ENABLE,
      XAIE_ENABLE,
      XAIETILE_STRSW_MPORT_CFGPKT(
          &(ctx->TileInst[x][y]),
          XAIETILE_STRSW_MPORT_NORTH(&(ctx->TileInst[x][y]), 1),
          XAIE_DISABLE /*drop_header*/, 0x8 /*mask*/, 0 /*arbiter*/));
  XAieTile_StrmConfigSlv(&(ctx->TileInst[x][y]),
                         XAIETILE_STRSW_SPORT_NORTH(&(ctx->TileInst[x][y]), 2),
                         XAIE_ENABLE, XAIE_ENABLE);
  XAieTile_StrmConfigSlvSlot(
      &(ctx->TileInst[x][y]),
      XAIETILE_STRSW_SPORT_NORTH(&(ctx->TileInst[x][y]), 2), 0 /*slot*/,
      XAIE_ENABLE,
      XAIETILE_STRSW_SLVSLOT_CFG(
          &(ctx->TileInst[x][y]),
          (XAIETILE_STRSW_SPORT_NORTH(&(ctx->TileInst[x][y]), 2)), 0 /*slot*/,
          0x2 /*ID value*/, 0x1F /*mask*/, XAIE_ENABLE, 1 /*msel*/,
          1 /*arbiter*/));
  XAieTile_StrmConfigSlv(&(ctx->TileInst[x][y]),
                         XAIETILE_STRSW_SPORT_NORTH(&(ctx->TileInst[x][y]), 1),
                         XAIE_ENABLE, XAIE_ENABLE);
  XAieTile_StrmConfigSlvSlot(
      &(ctx->TileInst[x][y]),
      XAIETILE_STRSW_SPORT_NORTH(&(ctx->TileInst[x][y]), 1), 0 /*slot*/,
      XAIE_ENABLE,
      XAIETILE_STRSW_SLVSLOT_CFG(
          &(ctx->TileInst[x][y]),
          (XAIETILE_STRSW_SPORT_NORTH(&(ctx->TileInst[x][y]), 1)), 0 /*slot*/,
          0x1 /*ID value*/, 0x1F /*mask*/, XAIE_ENABLE, 0 /*msel*/,
          1 /*arbiter*/));
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
          0x0 /*ID value*/, 0x1F /*mask*/, XAIE_ENABLE, 2 /*msel*/,
          1 /*arbiter*/));
  XAieTile_StrmConfigSlv(&(ctx->TileInst[x][y]),
                         XAIETILE_STRSW_SPORT_SOUTH(&(ctx->TileInst[x][y]), 1),
                         XAIE_ENABLE, XAIE_ENABLE);
  XAieTile_StrmConfigSlvSlot(
      &(ctx->TileInst[x][y]),
      XAIETILE_STRSW_SPORT_SOUTH(&(ctx->TileInst[x][y]), 1), 0 /*slot*/,
      XAIE_ENABLE,
      XAIETILE_STRSW_SLVSLOT_CFG(
          &(ctx->TileInst[x][y]),
          (XAIETILE_STRSW_SPORT_SOUTH(&(ctx->TileInst[x][y]), 1)), 0 /*slot*/,
          0x4 /*ID value*/, 0x1F /*mask*/, XAIE_ENABLE, 1 /*msel*/,
          0 /*arbiter*/));
  XAieTile_StrmConfigSlv(&(ctx->TileInst[x][y]),
                         XAIETILE_STRSW_SPORT_SOUTH(&(ctx->TileInst[x][y]), 1),
                         XAIE_ENABLE, XAIE_ENABLE);
  XAieTile_StrmConfigSlvSlot(
      &(ctx->TileInst[x][y]),
      XAIETILE_STRSW_SPORT_SOUTH(&(ctx->TileInst[x][y]), 1), 1 /*slot*/,
      XAIE_ENABLE,
      XAIETILE_STRSW_SLVSLOT_CFG(
          &(ctx->TileInst[x][y]),
          (XAIETILE_STRSW_SPORT_SOUTH(&(ctx->TileInst[x][y]), 1)), 1 /*slot*/,
          0x4 /*ID value*/, 0x1C /*mask*/, XAIE_ENABLE, 3 /*msel*/,
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
          0x0 /*ID value*/, 0x1F /*mask*/, XAIE_ENABLE, 2 /*msel*/,
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
          0x0 /*ID value*/, 0x1C /*mask*/, XAIE_ENABLE, 0 /*msel*/,
          0 /*arbiter*/));
  // Core Stream Switch column 11 row 3
  x = 11;
  y = 3;
  XAieTile_StrmConfigMstr(
      &(ctx->TileInst[x][y]),
      XAIETILE_STRSW_MPORT_DMA(&(ctx->TileInst[x][y]), 0), XAIE_ENABLE,
      XAIE_ENABLE,
      XAIETILE_STRSW_MPORT_CFGPKT(
          &(ctx->TileInst[x][y]),
          XAIETILE_STRSW_MPORT_DMA(&(ctx->TileInst[x][y]), 0),
          XAIE_ENABLE /*drop_header*/, 0x2 /*mask*/, 1 /*arbiter*/));
  XAieTile_StrmConfigMstr(
      &(ctx->TileInst[x][y]),
      XAIETILE_STRSW_MPORT_DMA(&(ctx->TileInst[x][y]), 1), XAIE_ENABLE,
      XAIE_ENABLE,
      XAIETILE_STRSW_MPORT_CFGPKT(
          &(ctx->TileInst[x][y]),
          XAIETILE_STRSW_MPORT_DMA(&(ctx->TileInst[x][y]), 1),
          XAIE_ENABLE /*drop_header*/, 0x4 /*mask*/, 1 /*arbiter*/));
  XAieTile_StrmConfigMstr(
      &(ctx->TileInst[x][y]),
      XAIETILE_STRSW_MPORT_SOUTH(&(ctx->TileInst[x][y]), 0), XAIE_ENABLE,
      XAIE_ENABLE,
      XAIETILE_STRSW_MPORT_CFGPKT(
          &(ctx->TileInst[x][y]),
          XAIETILE_STRSW_MPORT_SOUTH(&(ctx->TileInst[x][y]), 0),
          XAIE_DISABLE /*drop_header*/, 0x1 /*mask*/, 1 /*arbiter*/));
  XAieTile_StrmConfigMstr(
      &(ctx->TileInst[x][y]),
      XAIETILE_STRSW_MPORT_SOUTH(&(ctx->TileInst[x][y]), 1), XAIE_ENABLE,
      XAIE_ENABLE,
      XAIETILE_STRSW_MPORT_CFGPKT(
          &(ctx->TileInst[x][y]),
          XAIETILE_STRSW_MPORT_SOUTH(&(ctx->TileInst[x][y]), 1),
          XAIE_DISABLE /*drop_header*/, 0x2 /*mask*/, 0 /*arbiter*/));
  XAieTile_StrmConfigMstr(
      &(ctx->TileInst[x][y]),
      XAIETILE_STRSW_MPORT_SOUTH(&(ctx->TileInst[x][y]), 2), XAIE_ENABLE,
      XAIE_ENABLE,
      XAIETILE_STRSW_MPORT_CFGPKT(
          &(ctx->TileInst[x][y]),
          XAIETILE_STRSW_MPORT_SOUTH(&(ctx->TileInst[x][y]), 2),
          XAIE_DISABLE /*drop_header*/, 0x1 /*mask*/, 0 /*arbiter*/));
  XAieTile_StrmConfigMstr(
      &(ctx->TileInst[x][y]),
      XAIETILE_STRSW_MPORT_NORTH(&(ctx->TileInst[x][y]), 0), XAIE_ENABLE,
      XAIE_ENABLE,
      XAIETILE_STRSW_MPORT_CFGPKT(
          &(ctx->TileInst[x][y]),
          XAIETILE_STRSW_MPORT_NORTH(&(ctx->TileInst[x][y]), 0),
          XAIE_DISABLE /*drop_header*/, 0x8 /*mask*/, 0 /*arbiter*/));
  XAieTile_StrmConfigMstr(
      &(ctx->TileInst[x][y]),
      XAIETILE_STRSW_MPORT_NORTH(&(ctx->TileInst[x][y]), 1), XAIE_ENABLE,
      XAIE_ENABLE,
      XAIETILE_STRSW_MPORT_CFGPKT(
          &(ctx->TileInst[x][y]),
          XAIETILE_STRSW_MPORT_NORTH(&(ctx->TileInst[x][y]), 1),
          XAIE_DISABLE /*drop_header*/, 0x4 /*mask*/, 0 /*arbiter*/));
  XAieTile_StrmConfigSlv(&(ctx->TileInst[x][y]),
                         XAIETILE_STRSW_SPORT_NORTH(&(ctx->TileInst[x][y]), 2),
                         XAIE_ENABLE, XAIE_ENABLE);
  XAieTile_StrmConfigSlvSlot(
      &(ctx->TileInst[x][y]),
      XAIETILE_STRSW_SPORT_NORTH(&(ctx->TileInst[x][y]), 2), 0 /*slot*/,
      XAIE_ENABLE,
      XAIETILE_STRSW_SLVSLOT_CFG(
          &(ctx->TileInst[x][y]),
          (XAIETILE_STRSW_SPORT_NORTH(&(ctx->TileInst[x][y]), 2)), 0 /*slot*/,
          0x2 /*ID value*/, 0x1F /*mask*/, XAIE_ENABLE, 0 /*msel*/,
          0 /*arbiter*/));
  XAieTile_StrmConfigSlv(&(ctx->TileInst[x][y]),
                         XAIETILE_STRSW_SPORT_NORTH(&(ctx->TileInst[x][y]), 1),
                         XAIE_ENABLE, XAIE_ENABLE);
  XAieTile_StrmConfigSlvSlot(
      &(ctx->TileInst[x][y]),
      XAIETILE_STRSW_SPORT_NORTH(&(ctx->TileInst[x][y]), 1), 0 /*slot*/,
      XAIE_ENABLE,
      XAIETILE_STRSW_SLVSLOT_CFG(
          &(ctx->TileInst[x][y]),
          (XAIETILE_STRSW_SPORT_NORTH(&(ctx->TileInst[x][y]), 1)), 0 /*slot*/,
          0x1 /*ID value*/, 0x1F /*mask*/, XAIE_ENABLE, 1 /*msel*/,
          0 /*arbiter*/));
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
          1 /*arbiter*/));
  XAieTile_StrmConfigSlv(&(ctx->TileInst[x][y]),
                         XAIETILE_STRSW_SPORT_SOUTH(&(ctx->TileInst[x][y]), 1),
                         XAIE_ENABLE, XAIE_ENABLE);
  XAieTile_StrmConfigSlvSlot(
      &(ctx->TileInst[x][y]),
      XAIETILE_STRSW_SPORT_SOUTH(&(ctx->TileInst[x][y]), 1), 0 /*slot*/,
      XAIE_ENABLE,
      XAIETILE_STRSW_SLVSLOT_CFG(
          &(ctx->TileInst[x][y]),
          (XAIETILE_STRSW_SPORT_SOUTH(&(ctx->TileInst[x][y]), 1)), 0 /*slot*/,
          0x5 /*ID value*/, 0x1F /*mask*/, XAIE_ENABLE, 2 /*msel*/,
          1 /*arbiter*/));
  XAieTile_StrmConfigSlv(&(ctx->TileInst[x][y]),
                         XAIETILE_STRSW_SPORT_SOUTH(&(ctx->TileInst[x][y]), 1),
                         XAIE_ENABLE, XAIE_ENABLE);
  XAieTile_StrmConfigSlvSlot(
      &(ctx->TileInst[x][y]),
      XAIETILE_STRSW_SPORT_SOUTH(&(ctx->TileInst[x][y]), 1), 1 /*slot*/,
      XAIE_ENABLE,
      XAIETILE_STRSW_SLVSLOT_CFG(
          &(ctx->TileInst[x][y]),
          (XAIETILE_STRSW_SPORT_SOUTH(&(ctx->TileInst[x][y]), 1)), 1 /*slot*/,
          0x6 /*ID value*/, 0x1F /*mask*/, XAIE_ENABLE, 2 /*msel*/,
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
          0x1 /*ID value*/, 0x1F /*mask*/, XAIE_ENABLE, 1 /*msel*/,
          1 /*arbiter*/));
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
          0x2 /*ID value*/, 0x1F /*mask*/, XAIE_ENABLE, 3 /*msel*/,
          0 /*arbiter*/));
  // Core Stream Switch column 11 row 4
  x = 11;
  y = 4;
  XAieTile_StrmConfigMstr(
      &(ctx->TileInst[x][y]),
      XAIETILE_STRSW_MPORT_DMA(&(ctx->TileInst[x][y]), 0), XAIE_ENABLE,
      XAIE_ENABLE,
      XAIETILE_STRSW_MPORT_CFGPKT(
          &(ctx->TileInst[x][y]),
          XAIETILE_STRSW_MPORT_DMA(&(ctx->TileInst[x][y]), 0),
          XAIE_ENABLE /*drop_header*/, 0x1 /*mask*/, 0 /*arbiter*/));
  XAieTile_StrmConfigMstr(
      &(ctx->TileInst[x][y]),
      XAIETILE_STRSW_MPORT_DMA(&(ctx->TileInst[x][y]), 1), XAIE_ENABLE,
      XAIE_ENABLE,
      XAIETILE_STRSW_MPORT_CFGPKT(
          &(ctx->TileInst[x][y]),
          XAIETILE_STRSW_MPORT_DMA(&(ctx->TileInst[x][y]), 1),
          XAIE_ENABLE /*drop_header*/, 0x4 /*mask*/, 0 /*arbiter*/));
  XAieTile_StrmConfigMstr(
      &(ctx->TileInst[x][y]),
      XAIETILE_STRSW_MPORT_SOUTH(&(ctx->TileInst[x][y]), 0), XAIE_ENABLE,
      XAIE_ENABLE,
      XAIETILE_STRSW_MPORT_CFGPKT(
          &(ctx->TileInst[x][y]),
          XAIETILE_STRSW_MPORT_SOUTH(&(ctx->TileInst[x][y]), 0),
          XAIE_DISABLE /*drop_header*/, 0x1 /*mask*/, 1 /*arbiter*/));
  XAieTile_StrmConfigMstr(
      &(ctx->TileInst[x][y]),
      XAIETILE_STRSW_MPORT_SOUTH(&(ctx->TileInst[x][y]), 1), XAIE_ENABLE,
      XAIE_ENABLE,
      XAIETILE_STRSW_MPORT_CFGPKT(
          &(ctx->TileInst[x][y]),
          XAIETILE_STRSW_MPORT_SOUTH(&(ctx->TileInst[x][y]), 1),
          XAIE_DISABLE /*drop_header*/, 0x8 /*mask*/, 0 /*arbiter*/));
  XAieTile_StrmConfigMstr(
      &(ctx->TileInst[x][y]),
      XAIETILE_STRSW_MPORT_SOUTH(&(ctx->TileInst[x][y]), 2), XAIE_ENABLE,
      XAIE_ENABLE,
      XAIETILE_STRSW_MPORT_CFGPKT(
          &(ctx->TileInst[x][y]),
          XAIETILE_STRSW_MPORT_SOUTH(&(ctx->TileInst[x][y]), 2),
          XAIE_DISABLE /*drop_header*/, 0x2 /*mask*/, 0 /*arbiter*/));
  XAieTile_StrmConfigSlv(&(ctx->TileInst[x][y]),
                         XAIETILE_STRSW_SPORT_EAST(&(ctx->TileInst[x][y]), 0),
                         XAIE_ENABLE, XAIE_ENABLE);
  XAieTile_StrmConfigSlvSlot(
      &(ctx->TileInst[x][y]),
      XAIETILE_STRSW_SPORT_EAST(&(ctx->TileInst[x][y]), 0), 0 /*slot*/,
      XAIE_ENABLE,
      XAIETILE_STRSW_SLVSLOT_CFG(
          &(ctx->TileInst[x][y]),
          (XAIETILE_STRSW_SPORT_EAST(&(ctx->TileInst[x][y]), 0)), 0 /*slot*/,
          0x2 /*ID value*/, 0x1F /*mask*/, XAIE_ENABLE, 1 /*msel*/,
          0 /*arbiter*/));
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
          0x1 /*ID value*/, 0x1F /*mask*/, XAIE_ENABLE, 3 /*msel*/,
          0 /*arbiter*/));
  XAieTile_StrmConfigSlv(&(ctx->TileInst[x][y]),
                         XAIETILE_STRSW_SPORT_WEST(&(ctx->TileInst[x][y]), 0),
                         XAIE_ENABLE, XAIE_ENABLE);
  XAieTile_StrmConfigSlvSlot(
      &(ctx->TileInst[x][y]),
      XAIETILE_STRSW_SPORT_WEST(&(ctx->TileInst[x][y]), 0), 0 /*slot*/,
      XAIE_ENABLE,
      XAIETILE_STRSW_SLVSLOT_CFG(
          &(ctx->TileInst[x][y]),
          (XAIETILE_STRSW_SPORT_WEST(&(ctx->TileInst[x][y]), 0)), 0 /*slot*/,
          0x0 /*ID value*/, 0x1F /*mask*/, XAIE_ENABLE, 0 /*msel*/,
          1 /*arbiter*/));
  XAieTile_StrmConfigSlv(&(ctx->TileInst[x][y]),
                         XAIETILE_STRSW_SPORT_SOUTH(&(ctx->TileInst[x][y]), 1),
                         XAIE_ENABLE, XAIE_ENABLE);
  XAieTile_StrmConfigSlvSlot(
      &(ctx->TileInst[x][y]),
      XAIETILE_STRSW_SPORT_SOUTH(&(ctx->TileInst[x][y]), 1), 0 /*slot*/,
      XAIE_ENABLE,
      XAIETILE_STRSW_SLVSLOT_CFG(
          &(ctx->TileInst[x][y]),
          (XAIETILE_STRSW_SPORT_SOUTH(&(ctx->TileInst[x][y]), 1)), 0 /*slot*/,
          0x6 /*ID value*/, 0x1F /*mask*/, XAIE_ENABLE, 2 /*msel*/,
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
          0x2 /*ID value*/, 0x1F /*mask*/, XAIE_ENABLE, 0 /*msel*/,
          0 /*arbiter*/));
  // Core Stream Switch column 12 row 2
  x = 12;
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
          XAIE_ENABLE /*drop_header*/, 0x2 /*mask*/, 0 /*arbiter*/));
  XAieTile_StrmConfigMstr(
      &(ctx->TileInst[x][y]),
      XAIETILE_STRSW_MPORT_NORTH(&(ctx->TileInst[x][y]), 0), XAIE_ENABLE,
      XAIE_ENABLE,
      XAIETILE_STRSW_MPORT_CFGPKT(
          &(ctx->TileInst[x][y]),
          XAIETILE_STRSW_MPORT_NORTH(&(ctx->TileInst[x][y]), 0),
          XAIE_DISABLE /*drop_header*/, 0x1 /*mask*/, 0 /*arbiter*/));
  XAieTile_StrmConfigMstr(
      &(ctx->TileInst[x][y]),
      XAIETILE_STRSW_MPORT_NORTH(&(ctx->TileInst[x][y]), 1), XAIE_ENABLE,
      XAIE_ENABLE,
      XAIETILE_STRSW_MPORT_CFGPKT(
          &(ctx->TileInst[x][y]),
          XAIETILE_STRSW_MPORT_NORTH(&(ctx->TileInst[x][y]), 1),
          XAIE_DISABLE /*drop_header*/, 0x8 /*mask*/, 0 /*arbiter*/));
  XAieTile_StrmConfigSlv(&(ctx->TileInst[x][y]),
                         XAIETILE_STRSW_SPORT_SOUTH(&(ctx->TileInst[x][y]), 1),
                         XAIE_ENABLE, XAIE_ENABLE);
  XAieTile_StrmConfigSlvSlot(
      &(ctx->TileInst[x][y]),
      XAIETILE_STRSW_SPORT_SOUTH(&(ctx->TileInst[x][y]), 1), 0 /*slot*/,
      XAIE_ENABLE,
      XAIETILE_STRSW_SLVSLOT_CFG(
          &(ctx->TileInst[x][y]),
          (XAIETILE_STRSW_SPORT_SOUTH(&(ctx->TileInst[x][y]), 1)), 0 /*slot*/,
          0x4 /*ID value*/, 0x1F /*mask*/, XAIE_ENABLE, 2 /*msel*/,
          0 /*arbiter*/));
  XAieTile_StrmConfigSlv(&(ctx->TileInst[x][y]),
                         XAIETILE_STRSW_SPORT_SOUTH(&(ctx->TileInst[x][y]), 1),
                         XAIE_ENABLE, XAIE_ENABLE);
  XAieTile_StrmConfigSlvSlot(
      &(ctx->TileInst[x][y]),
      XAIETILE_STRSW_SPORT_SOUTH(&(ctx->TileInst[x][y]), 1), 1 /*slot*/,
      XAIE_ENABLE,
      XAIETILE_STRSW_SLVSLOT_CFG(
          &(ctx->TileInst[x][y]),
          (XAIETILE_STRSW_SPORT_SOUTH(&(ctx->TileInst[x][y]), 1)), 1 /*slot*/,
          0x4 /*ID value*/, 0x1C /*mask*/, XAIE_ENABLE, 3 /*msel*/,
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
          0x0 /*ID value*/, 0x1F /*mask*/, XAIE_ENABLE, 1 /*msel*/,
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
          0x0 /*ID value*/, 0x1C /*mask*/, XAIE_ENABLE, 0 /*msel*/,
          0 /*arbiter*/));
  // Core Stream Switch column 12 row 3
  x = 12;
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
          XAIE_ENABLE /*drop_header*/, 0x2 /*mask*/, 0 /*arbiter*/));
  XAieTile_StrmConfigMstr(
      &(ctx->TileInst[x][y]),
      XAIETILE_STRSW_MPORT_NORTH(&(ctx->TileInst[x][y]), 0), XAIE_ENABLE,
      XAIE_ENABLE,
      XAIETILE_STRSW_MPORT_CFGPKT(
          &(ctx->TileInst[x][y]),
          XAIETILE_STRSW_MPORT_NORTH(&(ctx->TileInst[x][y]), 0),
          XAIE_DISABLE /*drop_header*/, 0x1 /*mask*/, 0 /*arbiter*/));
  XAieTile_StrmConfigMstr(
      &(ctx->TileInst[x][y]),
      XAIETILE_STRSW_MPORT_NORTH(&(ctx->TileInst[x][y]), 1), XAIE_ENABLE,
      XAIE_ENABLE,
      XAIETILE_STRSW_MPORT_CFGPKT(
          &(ctx->TileInst[x][y]),
          XAIETILE_STRSW_MPORT_NORTH(&(ctx->TileInst[x][y]), 1),
          XAIE_DISABLE /*drop_header*/, 0x8 /*mask*/, 0 /*arbiter*/));
  XAieTile_StrmConfigSlv(&(ctx->TileInst[x][y]),
                         XAIETILE_STRSW_SPORT_SOUTH(&(ctx->TileInst[x][y]), 1),
                         XAIE_ENABLE, XAIE_ENABLE);
  XAieTile_StrmConfigSlvSlot(
      &(ctx->TileInst[x][y]),
      XAIETILE_STRSW_SPORT_SOUTH(&(ctx->TileInst[x][y]), 1), 0 /*slot*/,
      XAIE_ENABLE,
      XAIETILE_STRSW_SLVSLOT_CFG(
          &(ctx->TileInst[x][y]),
          (XAIETILE_STRSW_SPORT_SOUTH(&(ctx->TileInst[x][y]), 1)), 0 /*slot*/,
          0x5 /*ID value*/, 0x1F /*mask*/, XAIE_ENABLE, 1 /*msel*/,
          0 /*arbiter*/));
  XAieTile_StrmConfigSlv(&(ctx->TileInst[x][y]),
                         XAIETILE_STRSW_SPORT_SOUTH(&(ctx->TileInst[x][y]), 1),
                         XAIE_ENABLE, XAIE_ENABLE);
  XAieTile_StrmConfigSlvSlot(
      &(ctx->TileInst[x][y]),
      XAIETILE_STRSW_SPORT_SOUTH(&(ctx->TileInst[x][y]), 1), 1 /*slot*/,
      XAIE_ENABLE,
      XAIETILE_STRSW_SLVSLOT_CFG(
          &(ctx->TileInst[x][y]),
          (XAIETILE_STRSW_SPORT_SOUTH(&(ctx->TileInst[x][y]), 1)), 1 /*slot*/,
          0x6 /*ID value*/, 0x1F /*mask*/, XAIE_ENABLE, 3 /*msel*/,
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
          0x1 /*ID value*/, 0x1F /*mask*/, XAIE_ENABLE, 2 /*msel*/,
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
          0x2 /*ID value*/, 0x1F /*mask*/, XAIE_ENABLE, 0 /*msel*/,
          0 /*arbiter*/));
  // Core Stream Switch column 12 row 4
  x = 12;
  y = 4;
  XAieTile_StrmConfigMstr(
      &(ctx->TileInst[x][y]),
      XAIETILE_STRSW_MPORT_DMA(&(ctx->TileInst[x][y]), 0), XAIE_ENABLE,
      XAIE_ENABLE,
      XAIETILE_STRSW_MPORT_CFGPKT(
          &(ctx->TileInst[x][y]),
          XAIETILE_STRSW_MPORT_DMA(&(ctx->TileInst[x][y]), 0),
          XAIE_ENABLE /*drop_header*/, 0x2 /*mask*/, 0 /*arbiter*/));
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
      XAIETILE_STRSW_MPORT_WEST(&(ctx->TileInst[x][y]), 0), XAIE_ENABLE,
      XAIE_ENABLE,
      XAIETILE_STRSW_MPORT_CFGPKT(
          &(ctx->TileInst[x][y]),
          XAIETILE_STRSW_MPORT_WEST(&(ctx->TileInst[x][y]), 0),
          XAIE_DISABLE /*drop_header*/, 0x4 /*mask*/, 0 /*arbiter*/));
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
          0x2 /*ID value*/, 0x1F /*mask*/, XAIE_ENABLE, 2 /*msel*/,
          0 /*arbiter*/));
  XAieTile_StrmConfigSlv(&(ctx->TileInst[x][y]),
                         XAIETILE_STRSW_SPORT_SOUTH(&(ctx->TileInst[x][y]), 1),
                         XAIE_ENABLE, XAIE_ENABLE);
  XAieTile_StrmConfigSlvSlot(
      &(ctx->TileInst[x][y]),
      XAIETILE_STRSW_SPORT_SOUTH(&(ctx->TileInst[x][y]), 1), 0 /*slot*/,
      XAIE_ENABLE,
      XAIETILE_STRSW_SLVSLOT_CFG(
          &(ctx->TileInst[x][y]),
          (XAIETILE_STRSW_SPORT_SOUTH(&(ctx->TileInst[x][y]), 1)), 0 /*slot*/,
          0x6 /*ID value*/, 0x1F /*mask*/, XAIE_ENABLE, 1 /*msel*/,
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
          0x2 /*ID value*/, 0x1F /*mask*/, XAIE_ENABLE, 0 /*msel*/,
          0 /*arbiter*/));
  // Core Stream Switch column 12 row 0
  x = 12;
  y = 0;
  XAieTile_StrmConfigMstr(
      &(ctx->TileInst[x][y]),
      XAIETILE_STRSW_MPORT_NORTH(&(ctx->TileInst[x][y]), 0), XAIE_ENABLE,
      XAIE_ENABLE,
      XAIETILE_STRSW_MPORT_CFGPKT(
          &(ctx->TileInst[x][y]),
          XAIETILE_STRSW_MPORT_NORTH(&(ctx->TileInst[x][y]), 0),
          XAIE_DISABLE /*drop_header*/, 0x1 /*mask*/, 0 /*arbiter*/));
  XAieTile_StrmConfigMstr(
      &(ctx->TileInst[x][y]),
      XAIETILE_STRSW_MPORT_NORTH(&(ctx->TileInst[x][y]), 1), XAIE_ENABLE,
      XAIE_ENABLE,
      XAIETILE_STRSW_MPORT_CFGPKT(
          &(ctx->TileInst[x][y]),
          XAIETILE_STRSW_MPORT_NORTH(&(ctx->TileInst[x][y]), 1),
          XAIE_DISABLE /*drop_header*/, 0x2 /*mask*/, 0 /*arbiter*/));
  XAieTile_StrmConfigSlv(&(ctx->TileInst[x][y]),
                         XAIETILE_STRSW_SPORT_WEST(&(ctx->TileInst[x][y]), 1),
                         XAIE_ENABLE, XAIE_ENABLE);
  XAieTile_StrmConfigSlvSlot(
      &(ctx->TileInst[x][y]),
      XAIETILE_STRSW_SPORT_WEST(&(ctx->TileInst[x][y]), 1), 0 /*slot*/,
      XAIE_ENABLE,
      XAIETILE_STRSW_SLVSLOT_CFG(
          &(ctx->TileInst[x][y]),
          (XAIETILE_STRSW_SPORT_WEST(&(ctx->TileInst[x][y]), 1)), 0 /*slot*/,
          0x4 /*ID value*/, 0x1C /*mask*/, XAIE_ENABLE, 1 /*msel*/,
          0 /*arbiter*/));
  XAieTile_StrmConfigSlv(&(ctx->TileInst[x][y]),
                         XAIETILE_STRSW_SPORT_WEST(&(ctx->TileInst[x][y]), 0),
                         XAIE_ENABLE, XAIE_ENABLE);
  XAieTile_StrmConfigSlvSlot(
      &(ctx->TileInst[x][y]),
      XAIETILE_STRSW_SPORT_WEST(&(ctx->TileInst[x][y]), 0), 0 /*slot*/,
      XAIE_ENABLE,
      XAIETILE_STRSW_SLVSLOT_CFG(
          &(ctx->TileInst[x][y]),
          (XAIETILE_STRSW_SPORT_WEST(&(ctx->TileInst[x][y]), 0)), 0 /*slot*/,
          0x0 /*ID value*/, 0x1C /*mask*/, XAIE_ENABLE, 0 /*msel*/,
          0 /*arbiter*/));
  // Core Stream Switch column 12 row 1
  x = 12;
  y = 1;
  XAieTile_StrmConfigMstr(
      &(ctx->TileInst[x][y]),
      XAIETILE_STRSW_MPORT_NORTH(&(ctx->TileInst[x][y]), 0), XAIE_ENABLE,
      XAIE_ENABLE,
      XAIETILE_STRSW_MPORT_CFGPKT(
          &(ctx->TileInst[x][y]),
          XAIETILE_STRSW_MPORT_NORTH(&(ctx->TileInst[x][y]), 0),
          XAIE_DISABLE /*drop_header*/, 0x2 /*mask*/, 0 /*arbiter*/));
  XAieTile_StrmConfigMstr(
      &(ctx->TileInst[x][y]),
      XAIETILE_STRSW_MPORT_NORTH(&(ctx->TileInst[x][y]), 1), XAIE_ENABLE,
      XAIE_ENABLE,
      XAIETILE_STRSW_MPORT_CFGPKT(
          &(ctx->TileInst[x][y]),
          XAIETILE_STRSW_MPORT_NORTH(&(ctx->TileInst[x][y]), 1),
          XAIE_DISABLE /*drop_header*/, 0x1 /*mask*/, 0 /*arbiter*/));
  XAieTile_StrmConfigSlv(&(ctx->TileInst[x][y]),
                         XAIETILE_STRSW_SPORT_SOUTH(&(ctx->TileInst[x][y]), 1),
                         XAIE_ENABLE, XAIE_ENABLE);
  XAieTile_StrmConfigSlvSlot(
      &(ctx->TileInst[x][y]),
      XAIETILE_STRSW_SPORT_SOUTH(&(ctx->TileInst[x][y]), 1), 0 /*slot*/,
      XAIE_ENABLE,
      XAIETILE_STRSW_SLVSLOT_CFG(
          &(ctx->TileInst[x][y]),
          (XAIETILE_STRSW_SPORT_SOUTH(&(ctx->TileInst[x][y]), 1)), 0 /*slot*/,
          0x4 /*ID value*/, 0x1C /*mask*/, XAIE_ENABLE, 0 /*msel*/,
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
          0x0 /*ID value*/, 0x1C /*mask*/, XAIE_ENABLE, 1 /*msel*/,
          0 /*arbiter*/));
  // Core Stream Switch column 11 row 1
  x = 11;
  y = 1;
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
      XAIETILE_STRSW_MPORT_SOUTH(&(ctx->TileInst[x][y]), 1), XAIE_ENABLE,
      XAIE_ENABLE,
      XAIETILE_STRSW_MPORT_CFGPKT(
          &(ctx->TileInst[x][y]),
          XAIETILE_STRSW_MPORT_SOUTH(&(ctx->TileInst[x][y]), 1),
          XAIE_DISABLE /*drop_header*/, 0x8 /*mask*/, 0 /*arbiter*/));
  XAieTile_StrmConfigMstr(
      &(ctx->TileInst[x][y]),
      XAIETILE_STRSW_MPORT_SOUTH(&(ctx->TileInst[x][y]), 2), XAIE_ENABLE,
      XAIE_ENABLE,
      XAIETILE_STRSW_MPORT_CFGPKT(
          &(ctx->TileInst[x][y]),
          XAIETILE_STRSW_MPORT_SOUTH(&(ctx->TileInst[x][y]), 2),
          XAIE_DISABLE /*drop_header*/, 0x1 /*mask*/, 1 /*arbiter*/));
  XAieTile_StrmConfigMstr(
      &(ctx->TileInst[x][y]),
      XAIETILE_STRSW_MPORT_NORTH(&(ctx->TileInst[x][y]), 0), XAIE_ENABLE,
      XAIE_ENABLE,
      XAIETILE_STRSW_MPORT_CFGPKT(
          &(ctx->TileInst[x][y]),
          XAIETILE_STRSW_MPORT_NORTH(&(ctx->TileInst[x][y]), 0),
          XAIE_DISABLE /*drop_header*/, 0x1 /*mask*/, 0 /*arbiter*/));
  XAieTile_StrmConfigMstr(
      &(ctx->TileInst[x][y]),
      XAIETILE_STRSW_MPORT_NORTH(&(ctx->TileInst[x][y]), 1), XAIE_ENABLE,
      XAIE_ENABLE,
      XAIETILE_STRSW_MPORT_CFGPKT(
          &(ctx->TileInst[x][y]),
          XAIETILE_STRSW_MPORT_NORTH(&(ctx->TileInst[x][y]), 1),
          XAIE_DISABLE /*drop_header*/, 0x4 /*mask*/, 0 /*arbiter*/));
  XAieTile_StrmConfigSlv(&(ctx->TileInst[x][y]),
                         XAIETILE_STRSW_SPORT_NORTH(&(ctx->TileInst[x][y]), 2),
                         XAIE_ENABLE, XAIE_ENABLE);
  XAieTile_StrmConfigSlvSlot(
      &(ctx->TileInst[x][y]),
      XAIETILE_STRSW_SPORT_NORTH(&(ctx->TileInst[x][y]), 2), 0 /*slot*/,
      XAIE_ENABLE,
      XAIETILE_STRSW_SLVSLOT_CFG(
          &(ctx->TileInst[x][y]),
          (XAIETILE_STRSW_SPORT_NORTH(&(ctx->TileInst[x][y]), 2)), 0 /*slot*/,
          0x2 /*ID value*/, 0x1F /*mask*/, XAIE_ENABLE, 0 /*msel*/,
          1 /*arbiter*/));
  XAieTile_StrmConfigSlv(&(ctx->TileInst[x][y]),
                         XAIETILE_STRSW_SPORT_NORTH(&(ctx->TileInst[x][y]), 1),
                         XAIE_ENABLE, XAIE_ENABLE);
  XAieTile_StrmConfigSlvSlot(
      &(ctx->TileInst[x][y]),
      XAIETILE_STRSW_SPORT_NORTH(&(ctx->TileInst[x][y]), 1), 0 /*slot*/,
      XAIE_ENABLE,
      XAIETILE_STRSW_SLVSLOT_CFG(
          &(ctx->TileInst[x][y]),
          (XAIETILE_STRSW_SPORT_NORTH(&(ctx->TileInst[x][y]), 1)), 0 /*slot*/,
          0x1 /*ID value*/, 0x1F /*mask*/, XAIE_ENABLE, 3 /*msel*/,
          0 /*arbiter*/));
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
                         XAIETILE_STRSW_SPORT_SOUTH(&(ctx->TileInst[x][y]), 1),
                         XAIE_ENABLE, XAIE_ENABLE);
  XAieTile_StrmConfigSlvSlot(
      &(ctx->TileInst[x][y]),
      XAIETILE_STRSW_SPORT_SOUTH(&(ctx->TileInst[x][y]), 1), 0 /*slot*/,
      XAIE_ENABLE,
      XAIETILE_STRSW_SLVSLOT_CFG(
          &(ctx->TileInst[x][y]),
          (XAIETILE_STRSW_SPORT_SOUTH(&(ctx->TileInst[x][y]), 1)), 0 /*slot*/,
          0x4 /*ID value*/, 0x1C /*mask*/, XAIE_ENABLE, 2 /*msel*/,
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
          0x0 /*ID value*/, 0x1C /*mask*/, XAIE_ENABLE, 0 /*msel*/,
          0 /*arbiter*/));
  // Core Stream Switch column 10 row 1
  x = 10;
  y = 1;
  XAieTile_StrmConfigMstr(
      &(ctx->TileInst[x][y]),
      XAIETILE_STRSW_MPORT_NORTH(&(ctx->TileInst[x][y]), 0), XAIE_ENABLE,
      XAIE_ENABLE,
      XAIETILE_STRSW_MPORT_CFGPKT(
          &(ctx->TileInst[x][y]),
          XAIETILE_STRSW_MPORT_NORTH(&(ctx->TileInst[x][y]), 0),
          XAIE_DISABLE /*drop_header*/, 0x1 /*mask*/, 0 /*arbiter*/));
  XAieTile_StrmConfigMstr(
      &(ctx->TileInst[x][y]),
      XAIETILE_STRSW_MPORT_NORTH(&(ctx->TileInst[x][y]), 1), XAIE_ENABLE,
      XAIE_ENABLE,
      XAIETILE_STRSW_MPORT_CFGPKT(
          &(ctx->TileInst[x][y]),
          XAIETILE_STRSW_MPORT_NORTH(&(ctx->TileInst[x][y]), 1),
          XAIE_DISABLE /*drop_header*/, 0x2 /*mask*/, 0 /*arbiter*/));
  XAieTile_StrmConfigSlv(&(ctx->TileInst[x][y]),
                         XAIETILE_STRSW_SPORT_SOUTH(&(ctx->TileInst[x][y]), 1),
                         XAIE_ENABLE, XAIE_ENABLE);
  XAieTile_StrmConfigSlvSlot(
      &(ctx->TileInst[x][y]),
      XAIETILE_STRSW_SPORT_SOUTH(&(ctx->TileInst[x][y]), 1), 0 /*slot*/,
      XAIE_ENABLE,
      XAIETILE_STRSW_SLVSLOT_CFG(
          &(ctx->TileInst[x][y]),
          (XAIETILE_STRSW_SPORT_SOUTH(&(ctx->TileInst[x][y]), 1)), 0 /*slot*/,
          0x0 /*ID value*/, 0x1C /*mask*/, XAIE_ENABLE, 1 /*msel*/,
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
          0x4 /*ID value*/, 0x1C /*mask*/, XAIE_ENABLE, 0 /*msel*/,
          0 /*arbiter*/));
  // ShimMux column 10 row 0
  // NOTE ShimMux always connects from the south as directions are defined
  // relative to the tile stream switch
  x = 10;
  y = 0;
  XAieTile_ShimStrmMuxConfig(&(ctx->TileInst[x][y]),
                             XAIETILE_SHIM_STRM_MUX_SOUTH3,
                             XAIETILE_SHIM_STRM_MUX_DMA);
  XAieTile_ShimStrmMuxConfig(&(ctx->TileInst[x][y]),
                             XAIETILE_SHIM_STRM_MUX_SOUTH7,
                             XAIETILE_SHIM_STRM_MUX_DMA);
  // ShimMux column 11 row 0
  // NOTE ShimMux always connects from the south as directions are defined
  // relative to the tile stream switch
  x = 11;
  y = 0;
  XAieTile_ShimStrmDemuxConfig(&(ctx->TileInst[x][y]),
                               XAIETILE_SHIM_STRM_DEM_SOUTH2,
                               XAIETILE_SHIM_STRM_DEM_DMA);
  XAieTile_ShimStrmMuxConfig(&(ctx->TileInst[x][y]),
                             XAIETILE_SHIM_STRM_MUX_SOUTH3,
                             XAIETILE_SHIM_STRM_MUX_DMA);
  XAieTile_ShimStrmMuxConfig(&(ctx->TileInst[x][y]),
                             XAIETILE_SHIM_STRM_MUX_SOUTH7,
                             XAIETILE_SHIM_STRM_MUX_DMA);
} // mlir_aie_configure_switchboxes

const int buf15_offset = 4096;
int32_t mlir_aie_read_buffer_buf15(aie_libxaie_ctx_t *ctx, int index) {
  int32_t value =
      XAieTile_DmReadWord(&(ctx->TileInst[10][2]), buf15_offset + (index * 4));
  return value;
}
void mlir_aie_write_buffer_buf15(aie_libxaie_ctx_t *ctx, int index,
                                 int32_t value) {
  int32_t int_value = value;
  return XAieTile_DmWriteWord(&(ctx->TileInst[10][2]),
                              buf15_offset + (index * 4), int_value);
}
const int buf16_offset = 8192;
int32_t mlir_aie_read_buffer_buf16(aie_libxaie_ctx_t *ctx, int index) {
  int32_t value =
      XAieTile_DmReadWord(&(ctx->TileInst[10][2]), buf16_offset + (index * 4));
  return value;
}
void mlir_aie_write_buffer_buf16(aie_libxaie_ctx_t *ctx, int index,
                                 int32_t value) {
  int32_t int_value = value;
  return XAieTile_DmWriteWord(&(ctx->TileInst[10][2]),
                              buf16_offset + (index * 4), int_value);
}
const int buf17_offset = 12288;
int32_t mlir_aie_read_buffer_buf17(aie_libxaie_ctx_t *ctx, int index) {
  int32_t value =
      XAieTile_DmReadWord(&(ctx->TileInst[10][2]), buf17_offset + (index * 4));
  return value;
}
void mlir_aie_write_buffer_buf17(aie_libxaie_ctx_t *ctx, int index,
                                 int32_t value) {
  int32_t int_value = value;
  return XAieTile_DmWriteWord(&(ctx->TileInst[10][2]),
                              buf17_offset + (index * 4), int_value);
}
const int buf18_offset = 16384;
int32_t mlir_aie_read_buffer_buf18(aie_libxaie_ctx_t *ctx, int index) {
  int32_t value =
      XAieTile_DmReadWord(&(ctx->TileInst[10][2]), buf18_offset + (index * 4));
  return value;
}
void mlir_aie_write_buffer_buf18(aie_libxaie_ctx_t *ctx, int index,
                                 int32_t value) {
  int32_t int_value = value;
  return XAieTile_DmWriteWord(&(ctx->TileInst[10][2]),
                              buf18_offset + (index * 4), int_value);
}
const int buf29_offset = 4096;
int32_t mlir_aie_read_buffer_buf29(aie_libxaie_ctx_t *ctx, int index) {
  int32_t value =
      XAieTile_DmReadWord(&(ctx->TileInst[11][3]), buf29_offset + (index * 4));
  return value;
}
void mlir_aie_write_buffer_buf29(aie_libxaie_ctx_t *ctx, int index,
                                 int32_t value) {
  int32_t int_value = value;
  return XAieTile_DmWriteWord(&(ctx->TileInst[11][3]),
                              buf29_offset + (index * 4), int_value);
}
const int buf30_offset = 8192;
int32_t mlir_aie_read_buffer_buf30(aie_libxaie_ctx_t *ctx, int index) {
  int32_t value =
      XAieTile_DmReadWord(&(ctx->TileInst[11][3]), buf30_offset + (index * 4));
  return value;
}
void mlir_aie_write_buffer_buf30(aie_libxaie_ctx_t *ctx, int index,
                                 int32_t value) {
  int32_t int_value = value;
  return XAieTile_DmWriteWord(&(ctx->TileInst[11][3]),
                              buf30_offset + (index * 4), int_value);
}
const int buf31_offset = 12288;
int32_t mlir_aie_read_buffer_buf31(aie_libxaie_ctx_t *ctx, int index) {
  int32_t value =
      XAieTile_DmReadWord(&(ctx->TileInst[11][3]), buf31_offset + (index * 4));
  return value;
}
void mlir_aie_write_buffer_buf31(aie_libxaie_ctx_t *ctx, int index,
                                 int32_t value) {
  int32_t int_value = value;
  return XAieTile_DmWriteWord(&(ctx->TileInst[11][3]),
                              buf31_offset + (index * 4), int_value);
}
const int buf19_offset = 4096;
int32_t mlir_aie_read_buffer_buf19(aie_libxaie_ctx_t *ctx, int index) {
  int32_t value =
      XAieTile_DmReadWord(&(ctx->TileInst[10][3]), buf19_offset + (index * 4));
  return value;
}
void mlir_aie_write_buffer_buf19(aie_libxaie_ctx_t *ctx, int index,
                                 int32_t value) {
  int32_t int_value = value;
  return XAieTile_DmWriteWord(&(ctx->TileInst[10][3]),
                              buf19_offset + (index * 4), int_value);
}
const int buf20_offset = 8192;
int32_t mlir_aie_read_buffer_buf20(aie_libxaie_ctx_t *ctx, int index) {
  int32_t value =
      XAieTile_DmReadWord(&(ctx->TileInst[10][3]), buf20_offset + (index * 4));
  return value;
}
void mlir_aie_write_buffer_buf20(aie_libxaie_ctx_t *ctx, int index,
                                 int32_t value) {
  int32_t int_value = value;
  return XAieTile_DmWriteWord(&(ctx->TileInst[10][3]),
                              buf20_offset + (index * 4), int_value);
}
const int buf21_offset = 12288;
int32_t mlir_aie_read_buffer_buf21(aie_libxaie_ctx_t *ctx, int index) {
  int32_t value =
      XAieTile_DmReadWord(&(ctx->TileInst[10][3]), buf21_offset + (index * 4));
  return value;
}
void mlir_aie_write_buffer_buf21(aie_libxaie_ctx_t *ctx, int index,
                                 int32_t value) {
  int32_t int_value = value;
  return XAieTile_DmWriteWord(&(ctx->TileInst[10][3]),
                              buf21_offset + (index * 4), int_value);
}
const int buf22_offset = 4096;
int32_t mlir_aie_read_buffer_buf22(aie_libxaie_ctx_t *ctx, int index) {
  int32_t value =
      XAieTile_DmReadWord(&(ctx->TileInst[10][4]), buf22_offset + (index * 4));
  return value;
}
void mlir_aie_write_buffer_buf22(aie_libxaie_ctx_t *ctx, int index,
                                 int32_t value) {
  int32_t int_value = value;
  return XAieTile_DmWriteWord(&(ctx->TileInst[10][4]),
                              buf22_offset + (index * 4), int_value);
}
const int buf23_offset = 8192;
int32_t mlir_aie_read_buffer_buf23(aie_libxaie_ctx_t *ctx, int index) {
  int32_t value =
      XAieTile_DmReadWord(&(ctx->TileInst[10][4]), buf23_offset + (index * 4));
  return value;
}
void mlir_aie_write_buffer_buf23(aie_libxaie_ctx_t *ctx, int index,
                                 int32_t value) {
  int32_t int_value = value;
  return XAieTile_DmWriteWord(&(ctx->TileInst[10][4]),
                              buf23_offset + (index * 4), int_value);
}
const int buf24_offset = 12288;
int32_t mlir_aie_read_buffer_buf24(aie_libxaie_ctx_t *ctx, int index) {
  int32_t value =
      XAieTile_DmReadWord(&(ctx->TileInst[10][4]), buf24_offset + (index * 4));
  return value;
}
void mlir_aie_write_buffer_buf24(aie_libxaie_ctx_t *ctx, int index,
                                 int32_t value) {
  int32_t int_value = value;
  return XAieTile_DmWriteWord(&(ctx->TileInst[10][4]),
                              buf24_offset + (index * 4), int_value);
}
const int bui32_offset = 4096;
int32_t mlir_aie_read_buffer_bui32(aie_libxaie_ctx_t *ctx, int index) {
  int32_t value =
      XAieTile_DmReadWord(&(ctx->TileInst[11][4]), bui32_offset + (index * 4));
  return value;
}
void mlir_aie_write_buffer_bui32(aie_libxaie_ctx_t *ctx, int index,
                                 int32_t value) {
  int32_t int_value = value;
  return XAieTile_DmWriteWord(&(ctx->TileInst[11][4]),
                              bui32_offset + (index * 4), int_value);
}
const int buf33_offset = 8192;
int32_t mlir_aie_read_buffer_buf33(aie_libxaie_ctx_t *ctx, int index) {
  int32_t value =
      XAieTile_DmReadWord(&(ctx->TileInst[11][4]), buf33_offset + (index * 4));
  return value;
}
void mlir_aie_write_buffer_buf33(aie_libxaie_ctx_t *ctx, int index,
                                 int32_t value) {
  int32_t int_value = value;
  return XAieTile_DmWriteWord(&(ctx->TileInst[11][4]),
                              buf33_offset + (index * 4), int_value);
}
const int buf34_offset = 12288;
int32_t mlir_aie_read_buffer_buf34(aie_libxaie_ctx_t *ctx, int index) {
  int32_t value =
      XAieTile_DmReadWord(&(ctx->TileInst[11][4]), buf34_offset + (index * 4));
  return value;
}
void mlir_aie_write_buffer_buf34(aie_libxaie_ctx_t *ctx, int index,
                                 int32_t value) {
  int32_t int_value = value;
  return XAieTile_DmWriteWord(&(ctx->TileInst[11][4]),
                              buf34_offset + (index * 4), int_value);
}
const int buf42_offset = 4096;
int32_t mlir_aie_read_buffer_buf42(aie_libxaie_ctx_t *ctx, int index) {
  int32_t value =
      XAieTile_DmReadWord(&(ctx->TileInst[12][4]), buf42_offset + (index * 4));
  return value;
}
void mlir_aie_write_buffer_buf42(aie_libxaie_ctx_t *ctx, int index,
                                 int32_t value) {
  int32_t int_value = value;
  return XAieTile_DmWriteWord(&(ctx->TileInst[12][4]),
                              buf42_offset + (index * 4), int_value);
}
const int buf43_offset = 8192;
int32_t mlir_aie_read_buffer_buf43(aie_libxaie_ctx_t *ctx, int index) {
  int32_t value =
      XAieTile_DmReadWord(&(ctx->TileInst[12][4]), buf43_offset + (index * 4));
  return value;
}
void mlir_aie_write_buffer_buf43(aie_libxaie_ctx_t *ctx, int index,
                                 int32_t value) {
  int32_t int_value = value;
  return XAieTile_DmWriteWord(&(ctx->TileInst[12][4]),
                              buf43_offset + (index * 4), int_value);
}
const int buf44_offset = 12288;
int32_t mlir_aie_read_buffer_buf44(aie_libxaie_ctx_t *ctx, int index) {
  int32_t value =
      XAieTile_DmReadWord(&(ctx->TileInst[12][4]), buf44_offset + (index * 4));
  return value;
}
void mlir_aie_write_buffer_buf44(aie_libxaie_ctx_t *ctx, int index,
                                 int32_t value) {
  int32_t int_value = value;
  return XAieTile_DmWriteWord(&(ctx->TileInst[12][4]),
                              buf44_offset + (index * 4), int_value);
}
const int buf39_offset = 4096;
int32_t mlir_aie_read_buffer_buf39(aie_libxaie_ctx_t *ctx, int index) {
  int32_t value =
      XAieTile_DmReadWord(&(ctx->TileInst[12][3]), buf39_offset + (index * 4));
  return value;
}
void mlir_aie_write_buffer_buf39(aie_libxaie_ctx_t *ctx, int index,
                                 int32_t value) {
  int32_t int_value = value;
  return XAieTile_DmWriteWord(&(ctx->TileInst[12][3]),
                              buf39_offset + (index * 4), int_value);
}
const int buf40_offset = 8192;
int32_t mlir_aie_read_buffer_buf40(aie_libxaie_ctx_t *ctx, int index) {
  int32_t value =
      XAieTile_DmReadWord(&(ctx->TileInst[12][3]), buf40_offset + (index * 4));
  return value;
}
void mlir_aie_write_buffer_buf40(aie_libxaie_ctx_t *ctx, int index,
                                 int32_t value) {
  int32_t int_value = value;
  return XAieTile_DmWriteWord(&(ctx->TileInst[12][3]),
                              buf40_offset + (index * 4), int_value);
}
const int buf41_offset = 12288;
int32_t mlir_aie_read_buffer_buf41(aie_libxaie_ctx_t *ctx, int index) {
  int32_t value =
      XAieTile_DmReadWord(&(ctx->TileInst[12][3]), buf41_offset + (index * 4));
  return value;
}
void mlir_aie_write_buffer_buf41(aie_libxaie_ctx_t *ctx, int index,
                                 int32_t value) {
  int32_t int_value = value;
  return XAieTile_DmWriteWord(&(ctx->TileInst[12][3]),
                              buf41_offset + (index * 4), int_value);
}
const int buf25_offset = 4096;
int32_t mlir_aie_read_buffer_buf25(aie_libxaie_ctx_t *ctx, int index) {
  int32_t value =
      XAieTile_DmReadWord(&(ctx->TileInst[11][2]), buf25_offset + (index * 4));
  return value;
}
void mlir_aie_write_buffer_buf25(aie_libxaie_ctx_t *ctx, int index,
                                 int32_t value) {
  int32_t int_value = value;
  return XAieTile_DmWriteWord(&(ctx->TileInst[11][2]),
                              buf25_offset + (index * 4), int_value);
}
const int buf26_offset = 8192;
int32_t mlir_aie_read_buffer_buf26(aie_libxaie_ctx_t *ctx, int index) {
  int32_t value =
      XAieTile_DmReadWord(&(ctx->TileInst[11][2]), buf26_offset + (index * 4));
  return value;
}
void mlir_aie_write_buffer_buf26(aie_libxaie_ctx_t *ctx, int index,
                                 int32_t value) {
  int32_t int_value = value;
  return XAieTile_DmWriteWord(&(ctx->TileInst[11][2]),
                              buf26_offset + (index * 4), int_value);
}
const int buf27_offset = 12288;
int32_t mlir_aie_read_buffer_buf27(aie_libxaie_ctx_t *ctx, int index) {
  int32_t value =
      XAieTile_DmReadWord(&(ctx->TileInst[11][2]), buf27_offset + (index * 4));
  return value;
}
void mlir_aie_write_buffer_buf27(aie_libxaie_ctx_t *ctx, int index,
                                 int32_t value) {
  int32_t int_value = value;
  return XAieTile_DmWriteWord(&(ctx->TileInst[11][2]),
                              buf27_offset + (index * 4), int_value);
}
const int buf28_offset = 16384;
int32_t mlir_aie_read_buffer_buf28(aie_libxaie_ctx_t *ctx, int index) {
  int32_t value =
      XAieTile_DmReadWord(&(ctx->TileInst[11][2]), buf28_offset + (index * 4));
  return value;
}
void mlir_aie_write_buffer_buf28(aie_libxaie_ctx_t *ctx, int index,
                                 int32_t value) {
  int32_t int_value = value;
  return XAieTile_DmWriteWord(&(ctx->TileInst[11][2]),
                              buf28_offset + (index * 4), int_value);
}
const int buf35_offset = 4096;
int32_t mlir_aie_read_buffer_buf35(aie_libxaie_ctx_t *ctx, int index) {
  int32_t value =
      XAieTile_DmReadWord(&(ctx->TileInst[12][2]), buf35_offset + (index * 4));
  return value;
}
void mlir_aie_write_buffer_buf35(aie_libxaie_ctx_t *ctx, int index,
                                 int32_t value) {
  int32_t int_value = value;
  return XAieTile_DmWriteWord(&(ctx->TileInst[12][2]),
                              buf35_offset + (index * 4), int_value);
}
const int buf36_offset = 8192;
int32_t mlir_aie_read_buffer_buf36(aie_libxaie_ctx_t *ctx, int index) {
  int32_t value =
      XAieTile_DmReadWord(&(ctx->TileInst[12][2]), buf36_offset + (index * 4));
  return value;
}
void mlir_aie_write_buffer_buf36(aie_libxaie_ctx_t *ctx, int index,
                                 int32_t value) {
  int32_t int_value = value;
  return XAieTile_DmWriteWord(&(ctx->TileInst[12][2]),
                              buf36_offset + (index * 4), int_value);
}
const int buf37_offset = 12288;
int32_t mlir_aie_read_buffer_buf37(aie_libxaie_ctx_t *ctx, int index) {
  int32_t value =
      XAieTile_DmReadWord(&(ctx->TileInst[12][2]), buf37_offset + (index * 4));
  return value;
}
void mlir_aie_write_buffer_buf37(aie_libxaie_ctx_t *ctx, int index,
                                 int32_t value) {
  int32_t int_value = value;
  return XAieTile_DmWriteWord(&(ctx->TileInst[12][2]),
                              buf37_offset + (index * 4), int_value);
}
const int buf38_offset = 16384;
int32_t mlir_aie_read_buffer_buf38(aie_libxaie_ctx_t *ctx, int index) {
  int32_t value =
      XAieTile_DmReadWord(&(ctx->TileInst[12][2]), buf38_offset + (index * 4));
  return value;
}
void mlir_aie_write_buffer_buf38(aie_libxaie_ctx_t *ctx, int index,
                                 int32_t value) {
  int32_t int_value = value;
  return XAieTile_DmWriteWord(&(ctx->TileInst[12][2]),
                              buf38_offset + (index * 4), int_value);
}
