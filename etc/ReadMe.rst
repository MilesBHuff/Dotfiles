System Policies
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Hosts
================================================================================

Names
--------------------------------------------------------------------------------
| After careful consideration, it has been decided that hostnames should be
  random linguistic strings.  This is for the following reasons:
  
- Locations and location IDs are not static, and so cannot be used.
- Roles are not static, and so cannot be used.
- The same installation can be moved between several different computers, so
  machine IDs can't be used.
- The OS itself can change, so the OS name can't be used.
- Using names composed entirely of random numbers results in names that are
  hard for humans to use.

| Here are the rules determining how these strings should be constructed:

- They must be no longer than 15 characters.
  To a certain extent, 8 characters or less is preferrable.

  - Longer names are incompatible with certain older apps and protocols.
    
- Multi-word strings should have constituent words separated by dashes.

Users and groups
================================================================================

Configuration
--------------------------------------------------------------------------------
- 'root' has 'wheel' as its primary group
- All human users have 'users' as their primary group
- The default usermask is 5022

Usernames and groupnames
--------------------------------------------------------------------------------
- They must contain only lowercase ASCII letters and numbers.

  - Including special characters can confuse various applications, especially
    older ones

- They must be no longer than 8 characters.

  - Longer names are incompatible with certain older apps, even some that
    are commonly used, like ``ps``.

- They must start with a letter.
- They must be unique, even among each other.

Groupnames
--------------------------------------------------------------------------------
- Groupnames must not be valid usernames.

Usernames
--------------------------------------------------------------------------------
- Usernames must abide by the following scheme:

  - First three letters of family name

    - If no family name, use the first three letters of the given name
    - Putting the family name first helps with alphabetization
    - If family name is less than 3 chars, reduplicate.

  - First three letters of given name

    - If first name is less than 3 chars, reduplicate.

  - Two digits, which may be chosen at will
