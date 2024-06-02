<script lang="ts">
	import * as DropdownMenu from '$lib/components/ui/dropdown-menu/index.js';
	import { Button } from '$lib/components/ui/button/index.js';

	import { Input } from '$lib/components/ui/input/index.js';

	export let action: string;
	export let default_: string;
	export let options: string[];

	let search = '';

	$: filteredOptions = options.filter((option) =>
		option.toLowerCase().includes(search.toLowerCase())
	);
</script>

<DropdownMenu.Root>
	<DropdownMenu.Trigger asChild let:builder>
		<Button builders={[builder]} class="bg-opacity-0 border-[1px] border-opacity-25"
			>{action}</Button
		>
	</DropdownMenu.Trigger>
	<DropdownMenu.Content
		class="w-56 max-h-36 border-2 border-primary bg-primary bg-opacity-90 text-primary-foreground mt-2 overflow-auto text-lg font-semibold tracking-wide"
	>
		<DropdownMenu.RadioGroup bind:value={action}>
			<Input type="text" placeholder="search" bind:value={search} class="" />
			<DropdownMenu.RadioItem value={default_}>{default_}</DropdownMenu.RadioItem>
			{#each filteredOptions as option}
				<DropdownMenu.RadioItem value={option}>{option}</DropdownMenu.RadioItem>
			{/each}
		</DropdownMenu.RadioGroup>
	</DropdownMenu.Content>
</DropdownMenu.Root>
