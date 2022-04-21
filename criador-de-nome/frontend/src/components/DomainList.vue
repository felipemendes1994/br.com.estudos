<template>
	<div>
		<div id="main">
			<div class="container">
				<div class="row">
					<div class="col-md">
						<AppItemList title="Prefixos" type="prefix" v-bind:items="items.prefix" v-on:addItem="addItem" v-on:deleteItem="deleteItem"></AppItemList>
					</div>
					<div class="col-md">
						<AppItemList title="Sufixos" type="sufix" v-bind:items="items.sufix" v-on:addItem="addItem" v-on:deleteItem="deleteItem"></AppItemList>
					</div>
				</div>
				<br />
				<h5>Domains <span class="badge badge-info">{{ domains.length }}</span></h5>
				<div class="card">
					<div class="card-body">
						<ul class="list-group">
							<li class="list-group-item" v-for="domain in domains" v-bind:key="domain.name">
								<div class="row">
									<div class="col-md-6">{{ domain.name }}</div>
									<div class="col-md-3"><span v-bind:class="domain.classes">{{ domain.available }}</span></div>
									<div class="col-md-3 text-right">
										<button class="btn btn-info" @click="openDomain(domain)"><span class="fa fa-search"></span></button>&nbsp;
										<a class="btn btn-info" v-bind:href="domain.checkout" target="_blank"><span class="fa fa-shopping-cart"></span></a>
									</div>
								</div>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</template>

<script>
import { mapState, mapActions } from "vuex";
import "bootstrap/dist/css/bootstrap.css";
import "font-awesome/css/font-awesome.css";
import AppItemList from "./AppItemList";

export default {
	name: "App",
	components: {
		AppItemList
	},
	data: function() {
		return {};
	},
	methods: {
		...mapActions(["addItem","deleteItem","getItems","generateDomains"]),
		openDomain(domain){
			this.$router.push({
				path: `/domains/${domain.name}`
			});
		}
	},
	computed: {
		...mapState(["items","domains"])
	}
};

</script>

<style>
#slogan {
  margin-top: 30px;
  margin-bottom: 30px;
}

#main {
  background-color: #cccccc;
  padding-top: 30px;
  padding-bottom: 30px;
}
</style>