<script lang="ts">
	import { Progress } from '$lib/components/ui/progress';

	import Dropdown from '$lib/components/Dropdown.svelte';
	import Table from '$lib/components/Table.svelte';
	import Date from '$lib/components/Date.svelte';

	import parameters from '../parameters.json';

	// dropdown actions
	let action_court = 'all courts';
	let action_court_default = 'all courts';

	let action_case_type = 'all types';
	let action_case_type_default = 'all types';

	let action_location = 'everywhere';
	let action_location_default = 'everywhere';

	let action_status = 'all';
	let action_status_default = 'all';

	let action_subject = 'all subjects';
	let action_subject_default = 'all subjects';

	let action_rank = 'all ranks';
	let action_rank_default = 'all ranks';

	let action_service = 'all';
	let action_service_default = 'all';
</script>

<section class="px-4 py-4 flex flex-col gap-4 h-full">
	<!-- case section -->
	<section class="flex gap-4">
		<!-- case progress -->
		<section
			class="flex flex-col bg-muted-foreground bg-opacity-25 border-[1px] border-secondary border-opacity-25 w-[40%] rounded-xl px-16 py-6 gap-4"
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
			class="flex flex-col bg-muted-foreground bg-opacity-25 border-[1px] border-secondary border-opacity-25 w-[60%] rounded-xl py-6 gap-4"
		>
			<span class="text-xl flex items-center justify-center h-full gap-2"
				>get <strong>all cases</strong> from
				<div>
					<Dropdown
						bind:action={action_court}
						default_={action_court_default}
						options={parameters['COURT']}
					></Dropdown>
				</div>
				based on
				<div>
					<Dropdown
						bind:action={action_case_type}
						default_={action_case_type_default}
						options={parameters['CASE TYPE']}
					></Dropdown>
				</div>
				of cases from
				<div>
					{#if action_court == 'all courts'}
						everywhere
					{:else if action_court == 'AFT'}
						<Dropdown
							bind:action={action_location}
							default_={action_location_default}
							options={parameters['AFT BENCHES']}
						></Dropdown>
					{:else if action_court == 'HC'}
						<Dropdown
							bind:action={action_location}
							default_={action_location_default}
							options={parameters['HC BENCHES']}
						></Dropdown>
					{:else if action_court == 'SC'}
						DELHI
					{/if}
				</div>
			</span>
		</section>
	</section>

	<!-- queries section -->
	<section class="flex w-full justify-between gap-4">
		<section
			class="flex justify-center items-center bg-muted-foreground w-full bg-opacity-25 border-[1px] border-secondary border-opacity-25 rounded-xl px-4 py-6 gap-3 text-xl"
		>
			show
			<div>
				<Dropdown
					bind:action={action_status}
					default_={action_status_default}
					options={['settled', 'pending']}
				></Dropdown>
			</div>
			cases from
			<div>
				<Dropdown
					bind:action={action_court}
					default_={action_court_default}
					options={parameters['COURT']}
				></Dropdown>
			</div>
			of
			<div>
				<Dropdown
					bind:action={action_case_type}
					default_={action_case_type_default}
					options={parameters['CASE TYPE']}
				></Dropdown>
			</div>
			from
			<div>
				{#if action_court == 'all courts'}
					everywhere
				{:else if action_court == 'AFT'}
					<Dropdown
						bind:action={action_location}
						default_={action_location_default}
						options={parameters['AFT BENCHES']}
					></Dropdown>
				{:else if action_court == 'HC'}
					<Dropdown
						bind:action={action_location}
						default_={action_location_default}
						options={parameters['HC BENCHES']}
					></Dropdown>
				{:else if action_court == 'SC'}
					DELHI
				{/if}
			</div>
			based on
			<div>
				<Dropdown
					bind:action={action_subject}
					default_={action_subject_default}
					options={parameters['GEN SUBJECTS']}
				></Dropdown>
			</div>
			filed by
			<div>
				<Dropdown
					bind:action={action_rank}
					default_={action_rank_default}
					options={parameters['RANKS']}
				></Dropdown>
			</div>
			of service
			<div>
				<Dropdown
					bind:action={action_service}
					default_={action_service_default}
					options={parameters['ARM SERVICE']}
				></Dropdown>
			</div>
		</section>
	</section>

	<!-- table and info section -->
	<section class="flex gap-4 h-full">
		<Table />

		<!-- info display block -->

		<section class="flex flex-col gap-4 w-[40%] h-full">
			<section
				class="bg-muted-foreground bg-opacity-25 border-[1px] border-secondary border-opacity-25 rounded-xl flex justify-between py-4 px-24 text-xl"
			>
				<button>
					<i class="fa-solid fa-plus"></i>
				</button>
				<button>
					<i class="fa-solid fa-upload"></i>
				</button>
				<button>
					<i class="fa-solid fa-x"></i>
				</button>
			</section>

			<!-- info -->

			<section
				class="bg-muted-foreground bg-opacity-25 border-[1px] border-secondary border-opacity-25 rounded-xl flex flex-col gap-2 items-center py-4 h-full"
			>
				<span class="text-xl font-semibold">Extra Info</span>

				<div>
					<span class="text-lg font-semibold tracking-wider">cases in the coming week</span>
					<div class="flex justify-around">
						<div class="flex flex-col gap-4 items-center">
							<span>settled</span>
							<span>0</span>
						</div>
						<div class="flex flex-col items-center gap-4">
							<span>total</span>
							<span>0</span>
						</div>
						<div class="flex flex-col items-center gap-4">
							<span>pending</span>
							<span>0</span>
						</div>
					</div>
				</div>
				<!-- sep -->
				<div>
					<span class="text-lg font-semibold tracking-wider">cases in the coming month</span>
					<div class="flex justify-around">
						<div class="flex flex-col gap-4 items-center">
							<span>settled</span>
							<span>0</span>
						</div>
						<div class="flex flex-col items-center gap-4">
							<span>total</span>
							<span>0</span>
						</div>
						<div class="flex flex-col items-center gap-4">
							<span>pending</span>
							<span>0</span>
						</div>
					</div>
				</div>
				<!-- sep -->
				<div class="flex flex-col items-center w-full gap-2">
					<span class="text-lg font-semibold tracking-wider">cases in the custom range</span>
					<div class="flex justify-around w-[60%]">
						<div class="flex flex-col gap-4 items-center">
							<span>settled</span>
							<span>0</span>
						</div>
						<div class="flex flex-col items-center gap-4">
							<span>total</span>
							<span>0</span>
						</div>
						<div class="flex flex-col items-center gap-4">
							<span>pending</span>
							<span>0</span>
						</div>
					</div>
					<Date />
				</div>
			</section>
		</section>
	</section>
</section>
