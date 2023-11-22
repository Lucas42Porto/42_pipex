/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: lumarque <lumarque@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/04/28 21:04:55 by lumarque          #+#    #+#             */
/*   Updated: 2023/05/04 20:21:40 by lumarque         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdlib.h>
#include <stdio.h>
#include <string.h>

//test atoi
int	test(char *n)
{
	int		i1;
	int		i2;
	i1 = atoi(n);
	i2 = ft_atoi(n);
	if (0)
		printf("%d %d\n", i1, i2);
	return (i1 == i2);
}

int test_atoi(void)
{
	if (!test("0")
		|| !test("-0")
		|| !test("+0")
		|| !test("-")
		|| !test("+")
		|| !test("a")
		|| !test("+a")
		|| !test("-b")
		|| !test("7")
		|| !test("+7a3")
		|| !test("\t\n\r\v\f  469 \n")
		|| !test("-6O40")
		|| !test("++10")
		|| !test("--10")
		|| !test("2147483647")
		|| !test("-2147483648")
		|| !test("1000000000000")
		|| !test("-1000000000000"))
	{
		printf("KO: ft_atoi\n");
		return (1);
	}
	printf("OK: ft_atoi\n");
	if (!ft_test("9999999999999999999999999999999998"))
		printf("hummm \n");
	printf("or %d\n", atoi("9999999999999999999999999999999998"));
	printf("ft %d\n", ft_atoi("9999999999999999999999999999999998"));
	printf("or %d\n", atoi("1234567891113151719"));
	printf("ft %d\n", ft_atoi("1234567891113151719"));
	printf("or %d\n", atoi("9223372036854775808"));
	printf("ft %d\n", ft_atoi("9223372036854775808"));
	printf("or %d\n", atoi("-2147483649"));
	printf("ft %d\n", ft_atoi("-2147483649"));
	return (0);
}

//test itoa
int	testcmp(int i, char *a)
{
	return (!!strcmp(ft_itoa(i), a));
}
int test_itoa(void)
{
	if (testcmp(1, "1")
		|| testcmp(-1, "-1")
		|| testcmp(-10, "-10")
		|| testcmp(2147483647, "2147483647")
		|| testcmp(-2147483648, "-2147483648")
		|| testcmp(0, "0")
		|| testcmp(1000, "1000")
		|| testcmp(2345, "2345")
		|| testcmp(19, "19")
		|| testcmp(55, "55")
		|| testcmp(-3000, "-3000")
		|| testcmp(250000, "250000"))
	{
		printf("KO: ft_itoa\n");
		return (1);
	}
	printf("OK: ft_itoa\n");
	return (0);
}
