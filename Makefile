NAME        := fdf
CC          := gcc
FLAGS       := -Wall -Wextra -Werror -Iinclude -Imlx -I. -Ilibft
.DEFAULT_GOAL := all
SRCS        := \
	src/draw/fdf_draw_map.c \
	src/draw/fdf_draw_utis.c \
	src/draw/fdf_draw_utis_2.c \
	src/utils/fdf_error_utis.c \
	src/utils/fdf_file_utis.c \
	src/utils/fdf_ft_functions.c \
	src/utils/fdf_ft_strtol.c \
	src/init/fdf_init.c \
	src/init/fdf_init_2.c \
	src/fdf_main.c \
	src/init/fdf_map_filling.c \
	src/utils/fdf_map_utis.c \
	src/str_to_intarr.c
                         
OBJS        := $(SRCS:.c=.o)

.c.o:
	${CC}	${FLAGS}	-c 	$< 	-o 	${<:.c=.o}

RM          := rm -f
UNAME_S     := $(shell uname -s)

ifeq ($(UNAME_S),Linux)
	MLX_LINK_FLAGS := -Lmlx -lmlx -L/usr/lib -lXext -lX11 -lm -lz
else
	MLX_LINK_FLAGS := -Lmlx -lmlx -lm -framework OpenGL -framework AppKit
endif

prepare:
			@ if [ ! -d mlx ]; then git clone https://github.com/42paris/minilibx-linux mlx; fi
			@ if [ -d mlx ]; then $(MAKE) -C mlx all; fi
			@ if [ -d libft ]; then $(MAKE) -C libft all; fi

$(NAME): ${OBJS}
			$(CC) $(FLAGS) -o $(NAME) $(OBJS) $(MLX_LINK_FLAGS) -L./libft -lft

all: prepare ${NAME}

clean:
			@ if [ -d mlx ]; then $(MAKE) -C mlx clean; fi
			@ $(MAKE) -C libft clean
			@ ${RM} *.o */*.o */*/*.o
			@ rm -rf $(NAME).dSYM


fclean:     clean
			@ $(MAKE) -C libft fclean
			@ ${RM} ${NAME}
			@ rm -f libmlx.a
			@ if [ -d mlx ]; then $(MAKE) -C mlx clean; fi
			@ ${RM} libft/libft.a

re:         fclean all

.PHONY:     all prepare clean fclean re


