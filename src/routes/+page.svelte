<script lang="ts">
	import { Progress } from '$lib/components/ui/progress';

	import * as DropdownMenu from '$lib/components/ui/dropdown-menu/index.js';
	import { Button } from '$lib/components/ui/button/index.js';
	import { Input } from '$lib/components/ui/input/index.js';

	import { fade } from 'svelte/transition';

	let caseCourt = 'all courts';
	let caseType = 'all types';

	let action = 'show';
	let activityStatus = 'all';
	let filterParameter = 'no filters';

	let equalityDrawer = false;

	let lhs = 'parameter';
	let rhs = '';
</script>

<section class="px-4 py-4 flex flex-col gap-4">
	<!-- case section -->
	<section class="flex gap-4">
		<!-- case progress -->
		<section
			class="flex flex-col bg-muted-foreground bg-opacity-25 border-[1px] border-secondary border-opacity-25 w-[45%] rounded-xl px-16 py-6 gap-4"
		>
			<div class="flex justify-around">
				<div class="flex flex-col gap-4 items-center">
					<span class="text-2xl">settled</span>
					<span class="text-xl">0</span>
				</div>
				<div class="flex flex-col items-center gap-4">
					<span class="text-2xl">total</span>
					<span class="text-xl">0</span>
				</div>
				<div class="flex flex-col items-center gap-4">
					<span class="text-2xl">pending</span>
					<span class="text-xl">0</span>
				</div>
			</div>
			<Progress value={25} max={100} class="bg-secondary" />
		</section>

		<!-- case progress sorting -->
		<section
			class="flex flex-col bg-muted-foreground bg-opacity-25 border-[1px] border-secondary border-opacity-25 w-[55%] rounded-xl py-6 gap-4"
		>
			<span class="text-2xl flex items-center justify-center h-full gap-2"
				>get <strong>all cases</strong> from
				<div>
					<DropdownMenu.Root>
						<DropdownMenu.Trigger asChild let:builder>
							<Button builders={[builder]} class="bg-opacity-0 border-[1px] border-opacity-25"
								>{caseCourt}</Button
							>
						</DropdownMenu.Trigger>
						<DropdownMenu.Content class="w-56 text-lg">
							<DropdownMenu.RadioGroup bind:value={caseCourt}>
								<DropdownMenu.RadioItem value="Supreme Court">Supreme Court</DropdownMenu.RadioItem>
								<DropdownMenu.RadioItem value="High Court">High Court</DropdownMenu.RadioItem>
								<DropdownMenu.RadioItem value="AFT">AFT</DropdownMenu.RadioItem>
								<DropdownMenu.RadioItem value="all courts">All Courts</DropdownMenu.RadioItem>
							</DropdownMenu.RadioGroup>
						</DropdownMenu.Content>
					</DropdownMenu.Root>
				</div>
				based on
				<div>
					<DropdownMenu.Root>
						<DropdownMenu.Trigger asChild let:builder>
							<Button builders={[builder]} class="bg-opacity-0 border-[1px] border-opacity-25"
								>{caseType}</Button
							>
						</DropdownMenu.Trigger>
						<DropdownMenu.Content class="w-56 text-lg">
							<DropdownMenu.RadioGroup bind:value={caseType}>
								<DropdownMenu.RadioItem value="param1">Param1</DropdownMenu.RadioItem>
								<DropdownMenu.RadioItem value="param2">Param2</DropdownMenu.RadioItem>
								<DropdownMenu.RadioItem value="param3">Param3</DropdownMenu.RadioItem>
								<DropdownMenu.RadioItem value="no filters">no filters</DropdownMenu.RadioItem>
							</DropdownMenu.RadioGroup>
						</DropdownMenu.Content>
					</DropdownMenu.Root>
				</div>
				of cases
			</span>
		</section>
	</section>

	<!-- queries section -->
	<section class="flex w-full justify-between gap-4">
		<section
			class="flex items-center bg-muted-foreground w-full bg-opacity-25 border-[1px] border-secondary border-opacity-25 rounded-xl px-16 py-6 gap-3 text-xl"
		>
			<div>
				<DropdownMenu.Root>
					<DropdownMenu.Trigger asChild let:builder>
						<Button builders={[builder]} class="bg-opacity-0 border-[1px] border-opacity-25"
							>{action}</Button
						>
					</DropdownMenu.Trigger>
					<DropdownMenu.Content class="w-56 text-lg">
						<DropdownMenu.RadioGroup bind:value={action}>
							<DropdownMenu.RadioItem value="show">show</DropdownMenu.RadioItem>
							<DropdownMenu.RadioItem value="count">count</DropdownMenu.RadioItem>
						</DropdownMenu.RadioGroup>
					</DropdownMenu.Content>
				</DropdownMenu.Root>
			</div>
			<div>
				<DropdownMenu.Root>
					<DropdownMenu.Trigger asChild let:builder>
						<Button builders={[builder]} class="bg-opacity-0 border-[1px] border-opacity-25"
							>{activityStatus}</Button
						>
					</DropdownMenu.Trigger>
					<DropdownMenu.Content class="w-56 text-lg">
						<DropdownMenu.RadioGroup bind:value={activityStatus}>
							<DropdownMenu.RadioItem value="all">all</DropdownMenu.RadioItem>
							<DropdownMenu.RadioItem value="settled">settled</DropdownMenu.RadioItem>
							<DropdownMenu.RadioItem value="pending">pending</DropdownMenu.RadioItem>
						</DropdownMenu.RadioGroup>
					</DropdownMenu.Content>
				</DropdownMenu.Root>
			</div>
			cases from
			<div>
				<DropdownMenu.Root>
					<DropdownMenu.Trigger asChild let:builder>
						<Button builders={[builder]} class="bg-opacity-0 border-[1px] border-opacity-25"
							>{caseCourt}</Button
						>
					</DropdownMenu.Trigger>
					<DropdownMenu.Content class="w-56 text-lg">
						<DropdownMenu.RadioGroup bind:value={caseCourt}>
							<DropdownMenu.RadioItem value="Supreme Court">Supreme Court</DropdownMenu.RadioItem>
							<DropdownMenu.RadioItem value="High Court">High Court</DropdownMenu.RadioItem>
							<DropdownMenu.RadioItem value="AFT">AFT</DropdownMenu.RadioItem>
							<DropdownMenu.RadioItem value="all courts">All Courts</DropdownMenu.RadioItem>
						</DropdownMenu.RadioGroup>
					</DropdownMenu.Content>
				</DropdownMenu.Root>
			</div>
			of
			<div>
				<DropdownMenu.Root>
					<DropdownMenu.Trigger asChild let:builder>
						<Button builders={[builder]} class="bg-opacity-0 border-[1px] border-opacity-25"
							>{caseType}</Button
						>
					</DropdownMenu.Trigger>
					<DropdownMenu.Content class="w-56 text-lg">
						<DropdownMenu.RadioGroup bind:value={caseType}>
							<DropdownMenu.RadioItem value="param1">Param1</DropdownMenu.RadioItem>
							<DropdownMenu.RadioItem value="param2">Param2</DropdownMenu.RadioItem>
							<DropdownMenu.RadioItem value="param3">Param3</DropdownMenu.RadioItem>
							<DropdownMenu.RadioItem value="no filters">no filters</DropdownMenu.RadioItem>
						</DropdownMenu.RadioGroup>
					</DropdownMenu.Content>
				</DropdownMenu.Root>
			</div>
			based on
			<div>
				<DropdownMenu.Root>
					<DropdownMenu.Trigger asChild let:builder>
						<Button builders={[builder]} class="bg-opacity-0 border-[1px] border-opacity-25"
							>{filterParameter}</Button
						>
					</DropdownMenu.Trigger>
					<DropdownMenu.Content class="w-56 text-lg">
						<DropdownMenu.RadioGroup bind:value={filterParameter}>
							<DropdownMenu.RadioItem value="no filters">no filters</DropdownMenu.RadioItem>
							<DropdownMenu.RadioItem value="subject">subject</DropdownMenu.RadioItem>
						</DropdownMenu.RadioGroup>
					</DropdownMenu.Content>
				</DropdownMenu.Root>
			</div>
			{#if equalityDrawer}
				<span transition:fade class="flex items-center gap-3 w-[30%]">
					where
					<DropdownMenu.Root>
						<DropdownMenu.Trigger asChild let:builder>
							<Button builders={[builder]} class="bg-opacity-0 border-[1px] border-opacity-25"
								>{lhs}</Button
							>
						</DropdownMenu.Trigger>
						<DropdownMenu.Content class="w-56 text-lg">
							<DropdownMenu.RadioGroup bind:value={lhs}>
								<DropdownMenu.RadioItem value="parameter">parameter</DropdownMenu.RadioItem>
								<DropdownMenu.RadioItem value="param1">param1</DropdownMenu.RadioItem>
							</DropdownMenu.RadioGroup>
						</DropdownMenu.Content>
					</DropdownMenu.Root>
					=
					<div>
						<Input
							type="text"
							id="search"
							placeholder="search"
							bind:value={rhs}
							class="hover:border-2 border-[1px] border-opacity-25"
						/>
					</div>
					<button
						transition:fade
						class="border-[1px] border-muted-foreground border-opacity-25 px-3 py-1 rounded-lg hover:bg-muted-foreground hover:bg-opacity-50 transition-all duration-150"
						on:click|preventDefault={() => {
							equalityDrawer = false;
						}}>-</button
					>
				</span>
			{:else}
				<button
					transition:fade
					class="border-[1px] border-muted-foreground border-opacity-25 px-3 py-1 rounded-lg hover:bg-muted-foreground hover:bg-opacity-50 transition-all duration-150"
					on:click|preventDefault={() => {
						equalityDrawer = true;
					}}>+</button
				>
			{/if}
		</section>
		<section 
			class="flex items-center bg-muted-foreground w-fit bg-opacity-25 border-[1px] border-secondary border-opacity-25 rounded-xl px-4 hover:bg-opacity-50 transition-all duration-150"
		>
			<i class="fa-regular fa-file-excel text-2xl"></i>
		</section>
	</section>
</section>
