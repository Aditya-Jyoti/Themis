<script lang="ts">
	import * as DropdownMenu from '$lib/components/ui/dropdown-menu/index.js';
	import { Button } from '$lib/components/ui/button/index.js';

	export let action: string;
	export let default_: string;
	export let options: string[];
</script>

<DropdownMenu.Root>
	<DropdownMenu.Trigger asChild let:builder>
		<Button builders={[builder]} class="bg-opacity-0 border-[1px] border-opacity-25"
			>{action}</Button
		>
	</DropdownMenu.Trigger>
	<DropdownMenu.Content
		class="w-56 max-h-36 border-2 border-primary bg-primary bg-opacity-70 text-primary-foreground mt-2 overflow-auto text-lg font-semibold tracking-wide"
	>
		<DropdownMenu.RadioGroup bind:value={action}>
			<DropdownMenu.RadioItem value={default_}>{default_}</DropdownMenu.RadioItem>
			{#each options as option}
				<DropdownMenu.RadioItem value={option}>{option}</DropdownMenu.RadioItem>
			{/each}
		</DropdownMenu.RadioGroup>
	</DropdownMenu.Content>
</DropdownMenu.Root>
