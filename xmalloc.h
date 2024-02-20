/* $OpenBSD: xmalloc.h,v 1.20 2021/04/03 06:18:41 djm Exp $ */

/*
 * Author: Tatu Ylonen <ylo@cs.hut.fi>
 * Copyright (c) 1995 Tatu Ylonen <ylo@cs.hut.fi>, Espoo, Finland
 *                    All rights reserved
 * Created: Mon Mar 20 22:09:17 1995 ylo
 *
 * Versions of malloc and friends that check their results, and never return
 * failure (they call fatal if they encounter an error).
 *
 * As far as I am concerned, the code I have written for this software
 * can be used freely for any purpose.  Any derived versions of this
 * software must be clearly marked as such, and if the derived work is
 * incompatible with the protocol description in the RFC file, it must be
 * called by a name other than "ssh" or "Secure Shell".
 */

/* Deluge provides allocation APIs that have almost strictly stronger guarantees,
   except: Deluge's zalloc will not fail if asked to allocate zero bytes. What it
   will do in that case is return a pointer that knows that it points to zero
   bytes. So, any attempt to access the pointer will crash. I think that's probably
   good enough.
   
   But it's interesting to me that the SSH folks (and presumably the OpenBSD
   folks?) think it's best to crash on zero bytes. I wonder if they would think my
   solution of returning an inaccessible pointer is good enough for their tastes. */

void	*xmalloc(size_t);
void	*xcalloc(size_t, size_t);
void	*xreallocarray(void *, size_t, size_t);
void	*xrecallocarray(void *, size_t, size_t, size_t);
char	*xstrdup(const char *);
int	 xasprintf(char **, const char *, ...)
    __attribute__((__format__ (printf, 2, 3))) __attribute__((__nonnull__ (2)));
int	 xvasprintf(char **, const char *, va_list)
    __attribute__((__nonnull__ (2)));
