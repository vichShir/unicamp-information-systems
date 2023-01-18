#include <stdio.h>

int main ()
{
    int nums[10];
    int p_nums, i_nums;

    p_nums = 0;
    i_nums = 0;

    for (int i = 0; i < 10; i++)
    {
        scanf("%d", &nums[i]);

        if (nums[i] % 2 == 0)
            p_nums++;
        else if (nums[i] % 2 == 1)
            i_nums++;
    }

    printf("%d pares, %d impares\n", p_nums, i_nums);

    return 0;
}