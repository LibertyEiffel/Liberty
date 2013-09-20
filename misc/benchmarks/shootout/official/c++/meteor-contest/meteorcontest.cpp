// The Computer Language Shootout
// http://shootout.alioth.debian.org/
// contributed by Ben St. John (jbstjohn@gmx.net)
// some ideas taken from Kevin Barnes' implementation
#include <iostream>
#include <string>

using namespace std;

#define getMask(iPos) (1 << (iPos))

enum {X, Y, N_DIM};
enum {EVEN, ODD, N_PARITY};
enum {GOOD, BAD, ALWAYS_BAD};

typedef unsigned int TUInt32;
typedef unsigned long long TUInt64;
typedef signed char TInt8;
typedef TUInt32 BitVec;

static const int N_COL = 5;
static const int N_ROW = 10;
static const int N_CELL = N_COL * N_ROW;
static const int N_PIECE_TYPE = 10;

struct Piece;

struct Soln {
  static const int NO_PIECE = -1;

  void setCells(void);
  bool lessThan(Soln & r);
  string toString(void) const;
  void fill(int val);
  void spin(Soln & spun);

  bool isEmpty(void) {return (m_nPiece == 0);}
  void popPiece(void) {m_nPiece--; m_synched = false;}
  void pushPiece(BitVec vec, int iPiece, int row) {
    SPiece & p = m_pieces[m_nPiece++];
    p.vec = vec;
    p.iPiece = (short)iPiece;
    p.row = (short)row;
  }

  Soln(int fillVal);
  Soln() : m_synched(false), m_nPiece(0) {}

  struct SPiece {
    BitVec vec;
    short iPiece;
    short row;
    SPiece() {}
    SPiece(BitVec avec, TUInt32 apiece, TUInt32 arow) :
      vec(avec), iPiece(short(apiece)), row(short(arow))
    {}
  };
  SPiece m_pieces[N_PIECE_TYPE];
  TUInt32 m_nPiece;
  TInt8 m_cells[N_ROW][N_COL];
  bool m_synched;
};

//------------------------------------
struct Board {
   static const BitVec L_EDGE_MASK =
   (1LL <<  0) | (1LL <<  5) | (1LL << 10) | (1LL << 15) |
   (1LL << 20) | (1LL << 25) | (1LL << 30);
  static const BitVec R_EDGE_MASK = L_EDGE_MASK << 4;
  static const BitVec TOP_ROW = (1 << N_COL) - 1;
   static const BitVec ROW_0_MASK =
   TOP_ROW | (TOP_ROW << 10) | (TOP_ROW << 20) | (TOP_ROW << 30);
  static const BitVec ROW_1_MASK = ROW_0_MASK << 5;
  static const BitVec BOARD_MASK = (1 << 30) - 1;

  Board();

  static TUInt32 getIndex(TUInt32 x, TUInt32 y) { return y * N_COL + x; }
  static bool badRegion(BitVec & toFill, BitVec rNew);
  static int hasBadIslands(BitVec boardVec, int row);
  static int calcBadIslands(BitVec boardVec, int row);
  static bool hasBadIslandsSingle(BitVec boardVec, int row);
  static void calcAlwaysBad(void);

  void genAllSolutions(BitVec boardVec, TUInt32 placedPieces, TUInt32 iNextFill);
  void recordSolution(Soln & s);

  Soln m_curSoln;
  Soln m_minSoln;
  Soln m_maxSoln;
  TUInt32 m_nSoln;
};

//------------------------------------

struct Piece {
  struct Instance {
    TUInt64 m_allowed;
    BitVec m_vec;
    int m_offset;
  };

  static const int N_ELEM = 5;
  static const int N_ORIENT = 12;
  static const int ALL_PIECE_MASK = (1 << N_PIECE_TYPE) - 1;
  static const TUInt32 SKIP_PIECE = 5; // it's magic!

  typedef int TPts[N_ELEM][N_DIM];

  static const BitVec BaseVecs[N_PIECE_TYPE];
  static Piece s_basePiece[N_PIECE_TYPE][N_ORIENT];

  static const Instance & getPiece(TUInt32 iPiece, TUInt32 iOrient, TUInt32 iParity);
  static BitVec toBitVector(const TPts & pts);
  static void genOrientation(BitVec vec, TUInt32 iOrient, Piece & target);
  static void setCoordList(BitVec vec, TPts & pts);
  static void shiftUpLines(TPts & pts, int shift);
  static int shiftToX0(TPts & pts, Instance & instance, int offsetRow);
  void setOkPos(TUInt32 isOdd, int w, int h);
  static void genAllOrientations(void);

  Instance m_instance[N_PARITY];
};

struct OkPieces {
  TInt8 nPieces[N_PIECE_TYPE];
  TUInt32 pieceVec[N_PIECE_TYPE][Piece::N_ORIENT];
};

OkPieces g_okPieces[N_ROW][N_COL] = {{0}};

enum {OPEN, CLOSED, N_FIXED};
#define MAX_ISLAND_OFFSET 1024
struct IslandInfo {
  TUInt32 hasBad[N_FIXED][N_PARITY];
  TUInt32 isKnown[N_FIXED][N_PARITY];
  TUInt32 alwaysBad[N_PARITY];
};

IslandInfo g_islandInfo[MAX_ISLAND_OFFSET] = {0};
int g_nIslandInfo = 0;

//------------------------------------
Soln::Soln(int fillVal) :
  m_nPiece(0) {
  fill(fillVal);
}

void Soln::fill(int val) {
  m_synched = false;
  memset(m_cells, val, N_CELL);
}

string Soln::toString(void) const {
  string result;
  result.reserve(N_CELL * 2);

  for (int y = 0; y < N_ROW; y++) {
    for (int x = 0; x < N_COL; x++) {
      int val = m_cells[y][x];
      result += ((val == NO_PIECE) ? '.' : char('0' + val));
      result += ' ';
    }
    result += '\n';

    // indent every second line
    if (y % 2 == 0)
      result += " ";
  }
  return result;
}

void Soln::setCells(void) {
  if (m_synched)
    return;

  for (TUInt32 iPiece = 0; iPiece < m_nPiece; iPiece++) {
    const SPiece & p = m_pieces[iPiece];
    BitVec vec = p.vec;
    TInt8 pID = (TInt8)p.iPiece;
    int rowOffset = p.row;

    int nNewCells = 0;
    for (int y = rowOffset; y < N_ROW; y++) {
      for (int x = 0; x < N_COL; x++) {
	if (vec & 1) {
	  m_cells[y][x] = pID;
	  nNewCells++;
	}
	vec >>= 1;
      }
      if (nNewCells == Piece::N_ELEM)
	break;
    }
  }
  m_synched = true;
}

bool Soln::lessThan(Soln & r) {
  if (m_pieces[0].iPiece != r.m_pieces[0].iPiece) {
    return m_pieces[0].iPiece < r.m_pieces[0].iPiece;
  }

  setCells();
  r.setCells();

  for (int y = 0; y < N_ROW; y++) {
    for (int x = 0; x < N_COL; x++) {
      int lval = m_cells[y][x];
      int rval = r.m_cells[y][x];

      if (lval != rval)
	return (lval < rval);
    }
  }

  return false; // solutions are equal
}

void Soln::spin(Soln & spun) {
  setCells();

  // swap cells
  for (int y = 0; y < N_ROW; y++) {
    for (int x = 0; x < N_COL; x++) {
      TInt8 flipped = m_cells[N_ROW - y - 1][N_COL - x - 1];
      spun.m_cells[y][x] = flipped;
    }
  }

  // swap first and last pieces (the rest aren't used)
  spun.m_pieces[0].iPiece = m_pieces[N_PIECE_TYPE - 1].iPiece;
  spun.m_synched = true;
}

//------------------------------------

Piece Piece::s_basePiece[N_PIECE_TYPE][N_ORIENT];

const BitVec Piece::BaseVecs[] = {
  0x10f, 0x0cb, 0x1087, 0x427, 0x465,
  0x0c7, 0x8423, 0x0a7, 0x187, 0x08f
};

int floor(int top, int bot) {
  int toZero = top / bot;
  // negative numbers should be rounded down, not towards zero
  if ((toZero * bot != top) && ((top < 0) != (bot <= 0)))
    toZero--;

  return toZero;
}

const TUInt32 s_firstOne[32] = {
  0, 0, 1, 0,   2, 0, 1, 0,
  3, 0, 1, 0,   2, 0, 1, 0,

  4, 0, 1, 0,   2, 0, 1, 0,
  3, 0, 1, 0,   2, 0, 1, 0,
};

TUInt32 getFirstOne(BitVec v, TUInt32 startPos = 0) {
  if (v == (BitVec)0)
    return 0;

  TUInt32 iPos = startPos;
  BitVec mask = 0xff << startPos;
  while ((mask & v) == 0) {
    mask <<= 8;
    iPos += 8;
  }
  TUInt32 result = TUInt32((mask & v) >> iPos);
  TUInt32 resultLow = result & 0x0f;
  if (resultLow != 0)
    iPos += s_firstOne[resultLow];
  else
    iPos += 4 + s_firstOne[result >> 4];

  return iPos;
}

TUInt32 countOnes(BitVec v) {
  TUInt32 n = 0;
  while (v) {
    n++;
    v = v & (v - 1);
  }

  return n;
}

void Piece::setCoordList(BitVec vec, TPts & pts) {
  int iPt = 0;
  BitVec mask = 1;
  for (int y = 0; y < N_ROW; y++) {
    for (int x = 0; x < N_COL; x++) {
      if (mask & vec) {
	pts[iPt][X] = x;
	pts[iPt][Y] = y;

	iPt++;
      }
      mask <<= 1;
    }
  }
}

BitVec Piece::toBitVector(const TPts & pts) {
  int y, x;
  BitVec result = 0;
  for (int iPt = 0; iPt < N_ELEM; iPt++) {
    x = pts[iPt][X];
    y = pts[iPt][Y];

    int pos = Board::getIndex(x, y);
    result |= (1 << pos);
  }

  return result;
}

void Piece::shiftUpLines(TPts & pts, int shift) {
  // vertical shifts have a twist
  for (int iPt = 0; iPt < N_ELEM; iPt++) {
    int & rx = pts[iPt][X];
    int & ry = pts[iPt][Y];

    if (ry & shift & 0x1)
      rx++;
    ry -= shift;
  }
}

int Piece::shiftToX0(TPts & pts, Instance & instance, int offsetRow)
{
  // .. determine shift
  int x, y, iPt;
  int xMin = pts[0][X];
  int xMax = xMin;
  for (iPt = 1; iPt < N_ELEM; iPt++) {
    x = pts[iPt][X];
    y = pts[iPt][Y];

    if (x < xMin)
      xMin = x;
    else if (x > xMax)
      xMax = x;
  }

  // I'm dying for a 'foreach' here
  int offset = N_ELEM;
  for (iPt = 0; iPt < N_ELEM; iPt++) {
    int & rx = pts[iPt][X];
    int & ry = pts[iPt][Y];

    rx -= xMin;

    // check offset -- leftmost cell on top line
    if ((ry == offsetRow) && (rx < offset))
      offset = rx;
  }

  instance.m_offset = offset;
  instance.m_vec = toBitVector(pts);
  return xMax - xMin;
}

void Piece::setOkPos(TUInt32 isOdd, int w, int h) {
  Instance & p = m_instance[isOdd];
  TUInt64 & allowed = p.m_allowed = 0;
  TUInt64 posMask = 1LL << (isOdd * N_COL);

  for (int y = isOdd; y < N_ROW - h; y+=2, posMask <<= N_COL) {
    if (p.m_offset)
      posMask <<= p.m_offset;

    for (int xPos = 0; xPos < N_COL - p.m_offset; xPos++, posMask <<= 1) {
      // check if the new position is on the board
      if (xPos >= N_COL - w)
	continue;

      // move it to the desired location
      BitVec pieceVec = p.m_vec << xPos;

      if (Board::hasBadIslandsSingle(pieceVec, y))
	continue;

      // position is allowed
      allowed |= posMask;
    }
  }
}

void Piece::genOrientation(BitVec vec, TUInt32 iOrient, Piece & target)
{
  // get (x,y) coordinates
  TPts pts;
  setCoordList(vec, pts);

  int y, x, iPt;
  int rot = iOrient % 6;
  int flip = iOrient >= 6;
  if (flip) {
    for (iPt = 0; iPt < N_ELEM; iPt++)
      pts[iPt][Y] = -pts[iPt][Y];
  }

  // rotate as necessary
  while (rot--) {
    for (iPt = 0; iPt < N_ELEM; iPt++) {
      x = pts[iPt][X];
      y = pts[iPt][Y];

      // I just worked this out by hand. Took a while.
      int xNew = floor((2 * x - 3 * y + 1), 4);
      int yNew = floor((2 * x + y + 1), 2);
      pts[iPt][X] = xNew;
      pts[iPt][Y] = yNew;
    }
  }

  // determine vertical shift
  int yMin = pts[0][Y];
  int yMax = yMin;
  for (iPt = 1; iPt < N_ELEM; iPt++) {
    y = pts[iPt][Y];

    if (y < yMin)
      yMin = y;
    else if (y > yMax)
      yMax = y;
  }
  int h = yMax - yMin;
  Instance & even = target.m_instance[EVEN];
  Instance & odd = target.m_instance[ODD];

  shiftUpLines(pts, yMin);
  int w = shiftToX0(pts, even, 0);
  target.setOkPos(EVEN, w, h);
  even.m_vec >>= even.m_offset;

  // shift down one line
  shiftUpLines(pts, -1);
  w = shiftToX0(pts, odd, 1);
  // shift the bitmask back one line
  odd.m_vec >>= N_COL;
  target.setOkPos(ODD, w, h);
  odd.m_vec >>= odd.m_offset;
}

void Piece::genAllOrientations(void) {
  for (int iPiece = 0; iPiece < N_PIECE_TYPE; iPiece++) {
    BitVec refPiece = BaseVecs[iPiece];
    for (int iOrient = 0; iOrient < N_ORIENT; iOrient++) {
      Piece & p = s_basePiece[iPiece][iOrient];
      genOrientation(refPiece, iOrient, p);
      if ((iPiece == SKIP_PIECE) && ((iOrient / 3) & 1))
	p.m_instance[0].m_allowed = p.m_instance[1].m_allowed = 0;
    }
  }

  for (int iPiece = 0; iPiece < N_PIECE_TYPE; iPiece++) {
    for (int iOrient = 0; iOrient < N_ORIENT; iOrient++) {
      TUInt64 mask = 1;
      for (int iRow = 0; iRow < N_ROW; iRow++) {
	const Instance & p = getPiece(iPiece, iOrient, (iRow & 1));
	for (int iCol = 0; iCol < N_COL; iCol++) {
	  OkPieces & allowed = g_okPieces[iRow][iCol];
	  if (p.m_allowed & mask) {
	    TInt8 & nPiece = allowed.nPieces[iPiece];
	    allowed.pieceVec[iPiece][nPiece] = p.m_vec << iCol;
	    nPiece++;
	  }

	  mask <<= 1;
	}
      }
    }
  }
}


inline const Piece::Instance & Piece::getPiece(TUInt32 iPiece, TUInt32 iOrient, TUInt32 iParity) {
  return s_basePiece[iPiece][iOrient].m_instance[iParity];
}

// ------------------------------------

Board::Board() :
  m_curSoln(Soln::NO_PIECE), m_minSoln(N_PIECE_TYPE),
  m_maxSoln(Soln::NO_PIECE), m_nSoln(0)
{}

bool Board::badRegion(BitVec & toFill, BitVec rNew)
{
  // grow empty region, until it doesn't change any more
  BitVec region;
  do {
    region = rNew;

    // simple grow up/down
    rNew |= (region >> N_COL);
    rNew |= (region << N_COL);

    // grow right/left
    rNew |= (region & ~L_EDGE_MASK) >> 1;
    rNew |= (region & ~R_EDGE_MASK) << 1;

    // tricky growth
    BitVec evenRegion = region & (ROW_0_MASK & ~L_EDGE_MASK);
    rNew |= evenRegion >> (N_COL + 1);
    rNew |= evenRegion << (N_COL - 1);
    BitVec oddRegion = region & (ROW_1_MASK & ~R_EDGE_MASK);
    rNew |= oddRegion >> (N_COL - 1);
    rNew |= oddRegion << (N_COL + 1);

    // clamp against existing pieces
    rNew &= toFill;
  }
  while ((rNew != toFill) && (rNew != region));

  // subtract empty region from board
  toFill ^= rNew;

  TUInt32 nCells = countOnes(toFill);
  return (nCells % Piece::N_ELEM != 0);
}

int Board::hasBadIslands(BitVec boardVec, int row)
{
  // skip over any filled rows
  while ((boardVec & TOP_ROW) == TOP_ROW) {
    boardVec >>= N_COL;
    row++;
  }

  TUInt32 iInfo = boardVec & ((1 << 2 * N_COL) - 1);
  IslandInfo & info = g_islandInfo[iInfo];

  TUInt32 lastRow = (boardVec >> (2 * N_COL)) & TOP_ROW;
  TUInt32 mask = getMask(lastRow);
  TUInt32 isOdd = row & 1;
  TUInt32 & alwaysBad = info.alwaysBad[isOdd];

  if (alwaysBad & mask)
    return BAD;

  if (boardVec & (TOP_ROW << N_COL * 3))
    return calcBadIslands(boardVec, row);

  int isClosed = (row > 6); // because we track 3 rows
  TUInt32 & isKnownVector = info.isKnown[isOdd][isClosed];
  TUInt32 & badIsleVector = info.hasBad[isOdd][isClosed];

  if (isKnownVector & mask)
    return ((badIsleVector & mask) != 0);

  if (boardVec == 0)
    return GOOD;

  int hasBad = calcBadIslands(boardVec, row);

  isKnownVector |= mask;
  if (hasBad)
    badIsleVector |= mask;

  return hasBad;
}

TUInt32 g_firstRegion[] = {
  0x00, 0x01, 0x02, 0x03,   0x04, 0x01, 0x06, 0x07,
  0x08, 0x01, 0x02, 0x03,   0x0c, 0x01, 0x0e, 0x0f,

  0x10, 0x01, 0x02, 0x03,   0x04, 0x01, 0x06, 0x07,
  0x18, 0x01, 0x02, 0x03,   0x1c, 0x01, 0x1e, 0x1f
};

int Board::calcBadIslands(BitVec boardVec, int row)
{
  BitVec toFill = ~boardVec;
  if (row & 1) {
    row--;
    toFill <<= N_COL;
  }

  BitVec boardMask = BOARD_MASK; // all but the first two bits
  if (row > 4) {
    int boardMaskShift = (row - 4) * N_COL;
    boardMask >>= boardMaskShift;
  }
  toFill &= boardMask;

  // a little pre-work to speed things up
  BitVec bottom = (TOP_ROW << (5 * N_COL));
  bool filled = ((bottom & toFill) == bottom);
  while ((bottom & toFill) == bottom) {
    toFill ^= bottom;
    bottom >>= N_COL;
  }

  BitVec startRegion;
  if (filled || (row < 4))
    startRegion = bottom & toFill;
  else {
    startRegion = g_firstRegion[toFill & TOP_ROW];
    if (startRegion == 0) {
      startRegion = (toFill >> N_COL) & TOP_ROW;
      startRegion = g_firstRegion[startRegion];
      startRegion <<= N_COL;
    }
    startRegion |= (startRegion << N_COL) & toFill;
  }

  while (toFill) {
    if (badRegion(toFill, startRegion))
      return (toFill ? ALWAYS_BAD : BAD);
    int iPos = getFirstOne(toFill);
    startRegion = getMask(iPos);
  }

  return GOOD;
}

TUInt32 g_flip[] = {
  0x00, 0x10, 0x08, 0x18, 0x04, 0x14, 0x0c, 0x1c,
  0x02, 0x12, 0x0a, 0x1a, 0x06, 0x16, 0x0e, 0x1e,

  0x01, 0x11, 0x09, 0x19, 0x05, 0x15, 0x0d, 0x1d,
  0x03, 0x13, 0x0b, 0x1b, 0x07, 0x17, 0x0f, 0x1f,
};

inline TUInt32 flipTwoRows(TUInt32 bits) {
  TUInt32 flipped = g_flip[bits >> N_COL] << N_COL;
  return (flipped | g_flip[bits & Board::TOP_ROW]);
}

inline void markBad(IslandInfo & info, TUInt32 mask, int eo, bool always) {
  info.hasBad[eo][OPEN] |= mask;
  info.hasBad[eo][CLOSED] |= mask;

  if (always)
    info.alwaysBad[eo] |= mask;
}

void Board::calcAlwaysBad(void) {
  for (TUInt32 iWord = 1; iWord < MAX_ISLAND_OFFSET; iWord++) {
    IslandInfo & isleInfo = g_islandInfo[iWord];
    IslandInfo & flipped = g_islandInfo[flipTwoRows(iWord)];

    for (TUInt32 i = 0, mask = 1; i < 32; i++, mask <<= 1) {
      TUInt32 boardVec = (i << (2 * N_COL)) | iWord;
      if (isleInfo.isKnown[0][OPEN] & mask)
	continue;

      int hasBad = calcBadIslands(boardVec, 0);
      if (hasBad != GOOD) {
	bool always = (hasBad==ALWAYS_BAD);
	markBad(isleInfo, mask, EVEN, always);

	TUInt32 flipMask = getMask(g_flip[i]);
	markBad(flipped, flipMask, ODD, always);
      }
    }
    flipped.isKnown[1][OPEN] = TUInt32(-1);
    isleInfo.isKnown[0][OPEN] = TUInt32(-1);
  }
}

bool Board::hasBadIslandsSingle(BitVec boardVec, int row)
{
  BitVec toFill = ~boardVec;
  bool isOdd = (row & 1);
  if (isOdd) {
    row--;
    toFill <<= N_COL; // shift to even aligned
    toFill |= TOP_ROW;
  }

  BitVec startRegion = TOP_ROW;
  BitVec lastRow = TOP_ROW << (5 * N_COL);
  BitVec boardMask = BOARD_MASK; // all but the first two bits
  if (row >= 4)
    boardMask >>= ((row - 4) * N_COL);
  else if (isOdd || (row == 0))
    startRegion = lastRow;

  toFill &= boardMask;
  startRegion &= toFill;

  while (toFill) {
    if (badRegion(toFill, startRegion))
      return true;
    int iPos = getFirstOne(toFill);
    startRegion = getMask(iPos);
  }

  return false;
}

void Board::genAllSolutions(BitVec boardVec, TUInt32 placedPieces, TUInt32 row)
{
  while ((boardVec & TOP_ROW) == TOP_ROW) {
    boardVec >>= N_COL;
    row++;
  }
  TUInt32 iNextFill = s_firstOne[~boardVec & TOP_ROW];
  const OkPieces & allowed = g_okPieces[row][iNextFill];

  int iPiece = getFirstOne(~placedPieces);
  int pieceMask = getMask(iPiece);
  for (; iPiece < N_PIECE_TYPE; iPiece++, pieceMask <<= 1)
    {
      // skip if we've already used this piece
      if (pieceMask & placedPieces)
	continue;

      placedPieces |= pieceMask;
      for (int iOrient = 0; iOrient < allowed.nPieces[iPiece]; iOrient++) {
	BitVec pieceVec = allowed.pieceVec[iPiece][iOrient];

	// check if piece conflicts with other pieces
	if (pieceVec & boardVec)
	  continue;

	// add the piece to the board
	boardVec |= pieceVec;

	if (hasBadIslands(boardVec, row)) {
	  boardVec ^= pieceVec;
	  continue;
	}

	m_curSoln.pushPiece(pieceVec, iPiece, row);

	// recur or record solution
	if (placedPieces != Piece::ALL_PIECE_MASK)
	  genAllSolutions(boardVec, placedPieces, row);
	else
	  recordSolution(m_curSoln);

	// remove the piece before continuing with a new piece
	boardVec ^= pieceVec;
	m_curSoln.popPiece();
      }

      placedPieces ^= pieceMask;
    }
}

void Board::recordSolution(Soln & s) {
  m_nSoln += 2; // add solution and its rotation

  if (m_minSoln.isEmpty()) {
    m_minSoln = m_maxSoln = s;
    return;
  }

  if (s.lessThan(m_minSoln))
    m_minSoln = s;
  else if (m_maxSoln.lessThan(s))
    m_maxSoln = s;

  Soln spun;
  s.spin(spun);
  if (spun.lessThan(m_minSoln))
    m_minSoln = spun;
  else if (m_maxSoln.lessThan(spun))
    m_maxSoln = spun;
}

int main(int argc, char * []) {
  if (argc > 2)
    return 1; // spec says this is an error

  Board b;
  Piece::genAllOrientations();
  Board::calcAlwaysBad();
  b.genAllSolutions(0, 0, 0);

  cout << b.m_nSoln << " solutions found\n\n";
  cout << b.m_minSoln.toString() << '\n';
  cout << b.m_maxSoln.toString() << endl;

  return 0;
}
