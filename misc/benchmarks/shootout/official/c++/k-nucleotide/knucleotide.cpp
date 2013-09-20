// The Computer Language Shootout
// http://shootout.alioth.debian.org/
// Contributed by Paul Kitchin

#include <algorithm>
#include <cctype>
#include <cstring>
#include <iomanip>
#include <iostream>
#include <iterator>
#include <set>
#include <vector>
#include <ctime>

template < std::size_t size >
struct hasher
{
  static std::size_t const length = size;
  static char const * string(char const * string)
  {
    static char string_[size + 1] = {0};
    std::strncpy(string_, string, size);
    return string_;
  }
  std::size_t hash(char const * string) const
  {
    std::size_t h = 0;
    for (std::size_t i = 0; i < size; ++i)
      {
	h = (h * 4) + ((string[i] & 0x6) / 2);
      }
    return h;
  }
  bool equal(char const * lhs, char const * rhs) const
  {
    return std::strncmp(lhs, rhs, size) == 0;
  }
};

template < typename key, typename value, typename hash_traits >
class hashtable
  :
   private hash_traits
{

public:

      struct entry
      {
	entry()
	  :
	  key_(key()),
	  value_(value()),
	  next_(0)
	{
	}
	entry(key key_)
	  :
	  key_(key_),
	  value_(value()),
	  next_(0)
	{
	}
	bool operator<(entry const & entry) const
	{
	  return value_ > entry.value_;
	}
	key key_;
	value value_;
	entry * next_;
      };

  hashtable(std::size_t size)
    :
    size_(power_of_two(size)),
    table_(size_)
  {
  }

  value & operator[](key lookup_key)
  {
    entry * node = &table_[hash(lookup_key) & (size_ - 1)];
    if (node->key_)
      {
	while (!equal(lookup_key, node->key_) && node->next_)
	  {
	    node = node->next_;
	  }
	if (equal(lookup_key, node->key_))
	  {
	    return node->value_;
	  }
	node->next_ = new entry(value());
	node = node->next_;
      }
    node->key_ = lookup_key;
    return node->value_;
  }

  typedef typename std::vector< entry >::const_iterator const_iterator;

  const_iterator begin() const
  {
    return table_.begin();
  }

  const_iterator end() const
  {
    return table_.end();
  }

private:

  std::size_t power_of_two(std::size_t lower_bound)
  {
    for (std::size_t i = 4; i < 64 * 1024; i *= 2)
      {
	if (i >= lower_bound)
	  {
	    return i;
	  }
      }
    return 1024 * 64;
  }

  std::size_t size_;
  std::vector< entry > table_;

};

template < typename hasher >
void write_frequencies(std::vector< char > const & input)
{
  std::size_t sum = input.size() + 1 - hasher::length;
  typedef hashtable< char const *, std::size_t, hasher > frequency_table;
  frequency_table frequencies(std::min< std::size_t >(1 << (hasher::length * 2), sum));
  for (unsigned int i = 0, i_end = input.size() + 1 - hasher::length; i != i_end; ++i)
    {
      ++frequencies[&input[i]];
    }
  std::set< typename frequency_table::entry > ordered_entries(frequencies.begin(), frequencies.end());
  for (typename std::set< typename frequency_table::entry >::const_iterator i = ordered_entries.begin(), i_end = ordered_entries.end(); i != i_end; ++i)
    {
      std::cout << hasher::string(i->key_) << ' ' << (sum ? double(100 * i->value_) / sum : 0.0) << '\n';
    }
  std::cout << '\n';
}

template < typename hasher >
void write_count(std::vector< char > const & input, char const * string)
{
  std::size_t sum = input.size() + 1 - hasher::length;
  typedef hashtable< char const *, std::size_t, hasher > frequency_table;
  frequency_table frequencies(std::min< std::size_t >(1 << std::min(30u, hasher::length * 2), sum));
  for (unsigned int i = 0, i_end = input.size() + 1 - hasher::length; i != i_end; ++i)
    {
      ++frequencies[&input[i]];
    }
  std::cout << frequencies[string] << '\t' << string << '\n';
}

char to_upper(char c)
{
  return char(std::toupper(c));
}

int main()
{
  std::vector< char > input;
  char buffer[4096];
  while (std::cin.getline(buffer, 4096) && std::strncmp(buffer, ">THREE", 6) != 0)
    {
    }
  while (std::cin.getline(buffer, 4096) && buffer[0] != '>')
    {
      if (buffer[0] != ';')
	{
	  input.insert(input.end(), buffer, buffer + std::cin.gcount() - 1);
	}
    }
  std::transform(input.begin(), input.end(), input.begin(), to_upper);
  std::cout << std::setprecision(3) << std::setiosflags(std::ios::fixed);
  write_frequencies< hasher< 1 > >(input);
  write_frequencies< hasher< 2 > >(input);
  write_count< hasher< 3 > >(input, "GGT");
  write_count< hasher< 4 > >(input, "GGTA");
  write_count< hasher< 6 > >(input, "GGTATT");
  write_count< hasher< 12 > >(input, "GGTATTTTAATT");
  write_count< hasher< 18 > >(input, "GGTATTTTAATTTATAGT");
}
