# Enigma

## Purpose

Enigma is a tool for cracking an encryption algorithm. 

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `enigma` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:enigma, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/enigma](https://hexdocs.pm/enigma).


## Encryption Algorithm

This specific encryption algorithm will be the Caesar Cipher. From the [wiki page](https://en.wikipedia.org/wiki/Caesar_cipher):

```
It is a type of substitution cipher in which each letter in the plaintext is replaced by a letter some fixed number of positions down the alphabet. For example, with a left shift of 3, D would be replaced by A, E would become B, and so on.
```

Instead of using the same shift for every character, this algorithm will use 4 different shifts; The A, B, C, D shifts. Every fourth character will be shifted by the same amount. The 1st, 5th, and 9th characters will be shifted with the A shift. The 2nd, 6th, and 10th characters will be shifted with the B shift, etc.

We will utilize the standard lowercase alphabet + space, so 27 characters in total.

### Finding Shifts

Each shift will be the sum of two other shifts, or the Keys and the Offsets. The A shift will be the A key plus the A offset. The B shift will be the B key plus the B offset.

### Keys

The keys are created using a random 5 digit number and splitting it up.

For example:

02715 is the key

- A key: First two digits `02`
- B key: Second and third `27`
- C key: Third and fourth `71`
- D key: Fourth and fifth `15`

### Offsets

Offsets are found using date of transmission

- Consider the date formatted as a number, DDMMYY. If the date is August 4, 1995 it would be represented as `040895`
- Square the numeric form `1672401025`
- Take the last four digits `1025`
- A offset: The first digit `1`
- B offset: The second digit `0`
- C offset: The third digit `2`
- D offset: The fourth digit `5`

### Sample Encryption
Input 1: 

- Input: `"hello world"`
- Keys: `02`, `27`, `71`, `15`
- Offsets: `1`, `0`, `2`, `5`
- Final Shifts: `A: 3`, `B: 27`, `C: 73`, `D: 20`
- `h` is A shifted by `3`, `e` is B shifted by `27`, `l` is C shifted by `73`, `l` is D shifted by `20`
- `"hello world"` becomes `"keder ohulw"`

Input 2:

- Input: `"HELLO WORLD"` should be converted to `"hello world"`
- `"HELLO WORLD"` becomes `"keder ohulw"`

## Decrypting a Message

To decrypt a message, we need to know the key and date used for encryption. We can find total shifts using the same method as above. Each character is shifted backwards instead of forwards.

### Cracking the Key

When key is not known, we can crack encryption using date of transmission alone. Each encrypted message ends with the characters " end".