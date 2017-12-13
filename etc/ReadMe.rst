System Policies
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Users and groups
================================================================================

Configuration
--------------------------------------------------------------------------------
- 'root' has 'wheel' as its primary group
- All human users have 'users' as their primary group
- The default usermask is 5022

Groups
--------------------------------------------------------------------------------
- Groups and users may not match each other (per IBM policy)

Usernames
--------------------------------------------------------------------------------
- Usernames must contain only lowercase ASCII letters and numbers

  - Including special characters can confuse various applications, especially
    older ones

- Usernames must be no longer than 8 chars

  - Longer usernames are incompatible with certain older apps, even some that
    are commonly used, like ``ps``.

- Usernames must be unique

- Usernames must abide by the following scheme:

  - First three letters of family name

    - If no family name, use the first three letters of the given name
    - Putting the family name first helps with alphabetization
    - If family name is less than 3 chars, reduplicate.

  - First three letters of given name

    - If first name is less than 3 chars, reduplicate.

  - Two digits, which may be chosen at will
