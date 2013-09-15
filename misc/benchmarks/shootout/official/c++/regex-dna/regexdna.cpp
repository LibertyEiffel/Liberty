//
// The Computer Language Shootout
// http://shootout.alioth.debian.org/
//
// Contributed by Shyamal Prasad
// Modified by Paul Kitchin


// This implementation of regexdna does not use the POSIX regex
// included with the GNU libc. Instead it uses the Boost C++ libraries
//
// http://www.boost.org/libs/regex/doc/index.html
//
// (On Debian: apt-get install libboost-regex-dev before compiling,
//  and then "g++ -O3 -lboost_regex regexdna.cc -o regexdna
//  Gentoo seems to package boost as, well, 'boost')

#include <iostream>
#include <list>
#include <string>
#include <boost/regex.hpp>

class rope
{

public:

      struct iterator
	:
    public std::iterator< std::bidirectional_iterator_tag, char >
      {

	iterator()
	{
	}

	iterator(std::list< std::string >::iterator chunk)
	  :
	  chunk_(chunk),
	  position_(chunk->begin())
	{
	}

	iterator(std::list< std::string >::iterator chunk, std::string::iterator position)
	  :
	  chunk_(chunk),
	  position_(position)
	{
	  if (position_ == chunk_->end())
            {
	      ++chunk_;
	      position_ = chunk_->begin();
            }
	}

	iterator & operator++()
	{
	  ++position_;
	  if (position_ == chunk_->end())
            {
	      ++chunk_;
	      position_ = chunk_->begin();
            }
	  return *this;
	}

	iterator operator++(int)
	{
	  iterator pre_increment(*this);
	  operator++();
	  return pre_increment;
	}

	iterator operator+(std::size_t difference) const
	{
	  iterator result(*this);
	  std::size_t offset = std::distance(result.position_, result.chunk_->end());
	  if (offset > difference)
            {
	      result.position_ += difference;
	      return result;
            }
	  ++result.chunk_;
	  difference -= offset;
	  while (difference > 0)
            {
	      if (result.chunk_->size() > difference)
		{
                  result.position_ = result.chunk_->begin() + difference;
                  return result;
		}
	      difference -= result.chunk_->size();
	      ++result.chunk_;
            }
	  result.position_ = result.chunk_->begin();
	  return result;
	}
	iterator & operator--()
	{
	  if (position_ == chunk_->begin())
            {
	      --chunk_;
	      position_ = chunk_->end();
            }
	  --position_;
	  return *this;
	}

	char & operator*()
	{
	  return *position_;
	}

	std::list< std::string >::iterator chunk_;
	std::string::iterator position_;

      };

  rope(std::istream & stream)
    :
    data_(1, std::string(256, '\0'))
  {
    // technically undefined behaviour but works and
    // saves me having to implement replace for vector
    while (stream.read(&data_.back()[0], 256))
      {
	data_.push_back(std::string(256, '\0'));
      }
    data_.back().resize(stream.gcount());
    data_.push_back(std::string("", 1));
  }

  iterator begin()
  {
    return iterator(data_.begin());
  }

  iterator end()
  {
    return iterator(--data_.end());
  }

  std::size_t length() const
  {
    std::size_t l = 0;
    for (std::list< std::string >::const_iterator i = data_.begin(), end = data_.end(); i != end; ++i)
      {
	l += i->size();
      }
    --l;
    return l;
  }

  iterator replace(iterator begin, iterator end, char const * replacement)
  {
    if (begin.chunk_ == end.chunk_)
      {
	std::size_t offset = std::distance(begin.chunk_->begin(), begin.position_) + std::strlen(replacement);
	begin.chunk_->replace(begin.position_, end.position_, replacement);
	if (begin.chunk_->empty())
	  {
	    begin.chunk_ = data_.erase(begin.chunk_);
	  }
	return iterator(begin.chunk_, begin.chunk_->begin() + offset);
      }
    else
      {
	begin.chunk_->replace(begin.position_, begin.chunk_->end(), replacement);
	if (begin.chunk_->empty())
	  {
	    begin.chunk_ = data_.erase(begin.chunk_);
	  }
	else
	  {
	    ++begin.chunk_;
	  }
	data_.erase(begin.chunk_, end.chunk_);
	end.chunk_->erase(end.chunk_->begin(), end.position_);
	return iterator(end.chunk_, end.chunk_->begin());
      }
  }

private:

  std::list< std::string > data_;
};

bool operator==(const rope::iterator & lhs, const rope::iterator & rhs)
{
  return lhs.chunk_ == rhs.chunk_ && lhs.position_ == rhs.position_;
}

bool operator!=(const rope::iterator & lhs, const rope::iterator & rhs)
{
  return !(lhs == rhs);
}

template < typename type, std::size_t n >
std::size_t size(type (&)[n])
{
  return n;
}

void regex_replace(rope & data, boost::regex const & pattern, char const * replacement)
{
  rope::iterator begin = data.begin();
  rope::iterator end = data.end();
  boost::match_results< rope::iterator > results;
  while (boost::regex_search(begin, end, results, pattern))
    {
      rope::iterator match_begin = begin + results.position();
      rope::iterator match_end = match_begin + results.length();
      begin = data.replace(match_begin, match_end, replacement);
    }
}

int main()
{
  rope data(std::cin);
  std::size_t initial_length = data.length();
  boost::regex const strip(">[^\\n]*\\n|\\n");
  regex_replace(data, strip, "");
  static char const * patterns[] = {
    "agggtaaa|tttaccct",
    "[cgt]gggtaaa|tttaccc[acg]",
    "a[act]ggtaaa|tttacc[agt]t",
    "ag[act]gtaaa|tttac[agt]ct",
    "agg[act]taaa|ttta[agt]cct",
    "aggg[acg]aaa|ttt[cgt]ccct",
    "agggt[cgt]aa|tt[acg]accct",
    "agggta[cgt]a|t[acg]taccct",
      "agggtaa[cgt]|[acg]ttaccct"
  };
  for (int i = 0; i < size(patterns); ++i)
    {
      const boost::regex pattern(patterns[i]);
      typedef boost::regex_iterator< rope::iterator > match_iterator;
      std::cout << patterns[i] << ' ' << std::distance(match_iterator(data.begin(), data.end(), pattern), match_iterator()) << std::endl;
    }
  std::cout << '\n' << initial_length << '\n' << data.length() << '\n';
  typedef std::pair< char const *, char const * > pair;
  static const pair alternatives[] = {
    pair("B", "(c|g|t)"), pair("D", "(a|g|t)"), pair("H", "(a|c|t)"),
    pair("K", "(g|t)"), pair("M", "(a|c)"), pair("N", "(a|c|g|t)"),
    pair("R", "(a|g)"), pair("S", "(c|t)"), pair("V", "(a|c|g)"),
    pair("W", "(a|t)"), pair("Y", "(c|t)")
  };
  for (int i = 0; i < sizeof(alternatives) / sizeof(alternatives[0]); ++i)
    {
      regex_replace(data, boost::regex(alternatives[i].first), alternatives[i].second);
    }
  std::cout << data.length() << '\n';
}
