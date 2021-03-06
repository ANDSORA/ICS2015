#include "hal.h"
#include "device/video.h"
#include "device/palette.h"

#include <string.h>
#include <stdlib.h>

int get_fps();
void write_palette(void*, int);

//static void copy_format(SDL_PixelFormat*, SDL_PixelFormat*);


void SDL_BlitSurface(SDL_Surface *src, SDL_Rect *srcrect, 
		SDL_Surface *dst, SDL_Rect *dstrect) {
	//Log("SDL_BlitSurface");
	assert(dst && src);

	/* TODO: Performs a fast blit from the source surface to the 
	 * destination surface. Only the position is used in the
	 * ``dstrect'' (the width and height are ignored). If either
	 * ``srcrect'' or ``dstrect'' are NULL, the entire surface 
	 * (``src'' or ``dst'') is copied. The final blit rectangle 
	 * is saved in ``dstrect'' after all clipping is performed
	 * (``srcrect'' is not modified).
	 */

	int w,h;
	uint8_t *src_ptr, *dst_ptr;

	if(srcrect == NULL) {
		w = src->w;
		h = src->h;
		src_ptr = src->pixels;
	}
	else {
		w = srcrect->w;
		h = srcrect->h;
		src_ptr = src->pixels + srcrect->x + srcrect->y * src->w;
	}

	if(dstrect == NULL) {
		dst_ptr = dst->pixels;
	}
	else dst_ptr = dst->pixels + dstrect->x + dstrect->y * dst->w;

	int i;
	for(i=0; i<h; ++i) {
		memcpy(dst_ptr, src_ptr, w);
		src_ptr += src->w;
		dst_ptr += dst->w;
	}

	/*
	assert(srcrect && dstrect);

	dstrect->w = srcrect->w;
	dstrect->h = srcrect->h;

	dst->flags = src->flags;
	copy_format(dst->format, src->format);
	dst->pitch = src->pitch;
	dst->clip_rect.x = dstrect->x;
	dst->clip_rect.y = dstrect->y;
	dst->clip_rect.w = srcrect->w;
	dst->clip_rect.h = srcrect->h;

	dst->refcount = src->refcount;
	memcpy(dst->pixels, src->pixels, src->pitch * srcrect->h); */
	/*
	if(src->flags & SDL_HWSURFACE){
		Log("VMEM_ADDR");
		dst->pixels = (void *)VMEM_ADDR;
	}
	else{
		Log("pitch * height");
		assert(src->pitch == 320);
		memcpy(dst->pixels, src->pixels, src->pitch * srcrect->h);
	}*/
	//s->pixels = (flags & SDL_HWSURFACE ? (void *)VMEM_ADDR : malloc(s->pitch * height));
	//assert(0);
}

void SDL_FillRect(SDL_Surface *dst, SDL_Rect *dstrect, uint32_t color) {
	assert(dst);
	assert(color <= 0xff);

	/* TODO: Fill the rectangle area described by ``dstrect''
	 * in surface ``dst'' with color ``color''. If dstrect is
	 * NULL, fill the whole surface.
	 */
	int i;
	int w,h;
	uint8_t *dst_ptr;
	if(dstrect == NULL) {
		dst_ptr = dst->pixels;
		w = dst->w;
		h = dst->h;
	}
	else {
		dst_ptr = dst->pixels + dstrect->x + dstrect->y * dst->w;
		w = dstrect->w;
		h = dstrect->h;
	}

	for(i=0; i<h; ++i){
		memset(dst_ptr, color, w);
		dst_ptr += dst->w;
	}

	//assert(0);
}

void SDL_UpdateRect(SDL_Surface *screen, int x, int y, int w, int h) {
	//Log("SDL_Surface");
	assert(screen);
	assert(screen->pitch == 320);
	if(screen->flags & SDL_HWSURFACE) {
		if(x == 0 && y == 0) {
			/* Draw FPS */
			vmem = VMEM_ADDR;
			char buf[80];
			sprintf(buf, "%dFPS", get_fps());
			draw_string(buf, 0, 0, 10);
		}
		return;
	}

	/* TODO: Copy the pixels in the rectangle area to the screen. */
	int i;
	uint8_t *dst_ptr = screen->pixels + x + y * screen->w;
	uint8_t *src_ptr = (uint8_t *)(VMEM_ADDR + x + y * 320);
	for(i=0; i<h; ++i){
		memcpy(dst_ptr, src_ptr, w);
		dst_ptr += screen->w;
		src_ptr += 320;
	}
	/*
	int i,j;
	for(i=x; i<x+w; ++i){
		for(j=y; j<y+h; ++j){
			screen->pixels[i + (j-y) * 320] = *((uint8_t *)VMEM_ADDR + i + j * 320);
		}
	}*/
	//assert(0);
}

void SDL_SetPalette(SDL_Surface *s, int flags, SDL_Color *colors, 
		int firstcolor, int ncolors) {
	//Log("SDL_SetPalette");
	assert(s);
	assert(s->format);
	assert(s->format->palette);
	assert(firstcolor == 0);

	if(s->format->palette->colors == NULL || s->format->palette->ncolors != ncolors) {
		if(s->format->palette->ncolors != ncolors && s->format->palette->colors != NULL) {
			/* If the size of the new palette is different 
			 * from the old one, free the old one.
			 */
			free(s->format->palette->colors);
		}

		/* Get new memory space to store the new palette. */
		s->format->palette->colors = malloc(sizeof(SDL_Color) * ncolors);
		assert(s->format->palette->colors);
	}

	/* Set the new palette. */
	s->format->palette->ncolors = ncolors;
	memcpy(s->format->palette->colors, colors, sizeof(SDL_Color) * ncolors);

	if(s->flags & SDL_HWSURFACE) {
		/* TODO: Set the VGA palette by calling write_palette(). */
		//assert(0);
		write_palette(s->format->palette->colors, ncolors);
	}
}

/* ======== The following functions are already implemented. ======== */

void SDL_SoftStretch(SDL_Surface *src, SDL_Rect *srcrect, 
		SDL_Surface *dst, SDL_Rect *dstrect) {
	assert(src && dst);
	int x = (srcrect == NULL ? 0 : srcrect->x);
	int y = (srcrect == NULL ? 0 : srcrect->y);
	int w = (srcrect == NULL ? src->w : srcrect->w);
	int h = (srcrect == NULL ? src->h : srcrect->h);

	assert(dstrect);
	if(w == dstrect->w && h == dstrect->h) {
		/* The source rectangle and the destination rectangle
		 * are of the same size. If that is the case, there
		 * is no need to stretch, just copy. */
		SDL_Rect rect;
		rect.x = x;
		rect.y = y;
		rect.w = w;
		rect.h = h;
		SDL_BlitSurface(src, &rect, dst, dstrect);
	}
	else {
		/* No other case occurs in NEMU-PAL. */
		assert(0);
	}
}

SDL_Surface* SDL_CreateRGBSurface(uint32_t flags, int width, int height, int depth,
		uint32_t Rmask, uint32_t Gmask, uint32_t Bmask, uint32_t Amask) {
	SDL_Surface *s = malloc(sizeof(SDL_Surface));
	assert(s);
	s->format = malloc(sizeof(SDL_PixelFormat));
	assert(s);
	s->format->palette = malloc(sizeof(SDL_Palette));
	assert(s->format->palette);
	s->format->palette->colors = NULL;

	s->format->BitsPerPixel = depth;

	s->flags = flags;
	s->w = width;
	s->h = height;
	s->pitch = (width * depth) >> 3;
	s->pixels = (flags & SDL_HWSURFACE ? (void *)VMEM_ADDR : malloc(s->pitch * height));
	assert(s->pixels);

	return s;
}

SDL_Surface* SDL_SetVideoMode(int width, int height, int bpp, uint32_t flags) {
	return SDL_CreateRGBSurface(flags,  width, height, bpp,
			0x000000ff, 0x0000ff00, 0x00ff0000, 0xff000000);
}

void SDL_FreeSurface(SDL_Surface *s) {
	if(s != NULL) {
		if(s->format != NULL) {
			if(s->format->palette != NULL) {
				if(s->format->palette->colors != NULL) {
					free(s->format->palette->colors);
				}
				free(s->format->palette);
			}

			free(s->format);
		}
		
		if(s->pixels != NULL) {
			free(s->pixels);
		}

		free(s);
	}
}


///////////////////// --ANDSORA /////////////////////////

/*
static void copy_format(SDL_PixelFormat *dst, SDL_PixelFormat *src){
	dst->palette->ncolors = src->palette->ncolors;
	dst->palette->colors->r = src->palette->colors->r;
	dst->palette->colors->g = src->palette->colors->g;
	dst->palette->colors->b = src->palette->colors->b;
	dst->palette->colors->unused = src->palette->colors->unused;

	dst->BitsPerPixel = src->BitsPerPixel;
	dst->BytesPerPixel = src->BytesPerPixel;
	
	dst->Rloss = src->Rloss;
	dst->Gloss = src->Gloss;
	dst->Bloss = src->Bloss;
	dst->Aloss = src->Aloss;

	dst->Rshift = src->Rshift;
	dst->Gshift = src->Gshift;
	dst->Bshift = src->Bshift;
	dst->Ashift = src->Ashift;

	dst->Rmask = src->Rmask;
	dst->Gmask = src->Gmask;
	dst->Bmask = src->Bmask;
	dst->Amask = src->Amask;

	dst->colorkey = src->colorkey;
	dst->alpha = src->alpha;
} */
